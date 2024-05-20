//
//  PreferencesView+Observer.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct Preference {
    let id: String
    let displayName: String
    let type: Any
    var value: Any
}

extension PreferencesView {
    class Observed: ObservableObject {
        @EnvironmentObject var appState: AppState

        func loadPreferenceList(completion: () -> Void?) {
            appState.isLoading = true
        }
        
        func updatePreference(preference: Preference, completion: () -> Void) {
            appState.isLoading = true
            appState.preferenceList = []
        }
    }
}
