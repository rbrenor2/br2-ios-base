//
//  PreferencesView+Observer.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI
import Combine

@MainActor
class PreferenceViewModel: ObservableObject {
    var appState: AppState
    private let preferenceService = PreferenceService()

    @Published var preferences: [Preference] = [
        Preference(id: "aosidjaos-erferfid-erfknj" ,displayName: "Username", type: PreferenceType.TEXT_INPUT.rawValue, valueText: "Breno Rios"),
        Preference(id: "34tegr-eroiufn-erf", displayName: "Notifications", type: PreferenceType.TOGGLE.rawValue, valueBool: true ),
        Preference(id: "neoijfe-804ro3ji-erf", displayName: "Age", type: PreferenceType.INTEGER_INPUT.rawValue, valueInt: 25)
    ]

    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState) {
        self.appState = appState
        self.preferences = appState.preferences ??  [
            Preference(id: "aosidjaos-erferfid-erfknj" ,displayName: "Username", type: PreferenceType.TEXT_INPUT.rawValue, valueText: "Breno Rios"),
            Preference(id: "34tegr-eroiufn-erf", displayName: "Notifications", type: PreferenceType.TOGGLE.rawValue, valueBool: true ),
            Preference(id: "neoijfe-804ro3ji-erf", displayName: "Age", type: PreferenceType.INTEGER_INPUT.rawValue, valueInt: 25)
        ]
    }
    
    func loadPreferences() {
        if appState.preferences == nil {
            self.fetchPreferencesFromUser()
        }
    }
    
    func fetchPreferencesFromUser() {
        appState.isLoading = true
        
        preferenceService.getPreferencesForUser(email: appState.user?.email ?? "")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.appState.isLoading = false
                switch completion {
                case .failure(let error):
                    self.appState.error = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { preferences in
                
                self.appState.preferences = preferences.map({ preference in
                    let info = self.appState.preferencesDefinition?.filter({ definition in
                        definition.id == preference.id
                    })[0]
                    
                    var newPreference = preference
                    newPreference.displayName = info?.displayName
                    newPreference.type = info?.type
                    
                    return newPreference
                })
                print(preferences)
                
            }
            .store(in: &cancellables)
    }
    
    
}
