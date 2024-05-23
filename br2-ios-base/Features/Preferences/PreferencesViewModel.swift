//
//  PreferencesView+Observer.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI
import Combine

struct Preference {
    let id: String
    let displayName: String
    let type: Any
    var value: Any
}

@MainActor
class PreferencesViewModel: ObservableObject {
    var appState: AppState
    
    @Published var preferences: [Preference] = [
        Preference(id: "aosidjaos-erferfid-erfknj" ,displayName: "Username", type: String.self, value: "John Doe"),
        Preference(id: "34tegr-eroiufn-erf", displayName: "Notifications", type: Bool.self, value: true),
        Preference(id: "neoijfe-804ro3ji-erf", displayName: "Age", type: Int.self, value: 30)
    ]

    
    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState) {
        self.appState = appState
//        setupBindings()
    }

    
  
    
//    private func setupBindings() {
//        Publishers.CombineLatest($email, $password)
//            .map { [weak self] email, password in
//                return !(self?.isValidEmail(email) ?? false) || password.isEmpty
//            }
//            .assign(to: \.isLoginButtonDisabled, on: self)
//            .store(in: &cancellables)
//    }

//    private func isValidEmail(_ email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailPredicate.evaluate(with: email)
//    }
}
