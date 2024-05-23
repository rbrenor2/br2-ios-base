//
//  UserProfileView+Observer.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

enum AccountPlanType {
    case Free
}

struct AccountPlan {
    let displayName: String
    let type: AccountPlanType
}

struct UserProfile {
    let name: String
    let email: String
    let accountPlan: AccountPlan
}

import SwiftUI
import FirebaseAuth
import Combine

@MainActor
class UserProfileViewModel: ObservableObject {
    var appState: AppState
    @Published var userAvatarUrl: String = ""
    @Published var name: String = "John Doe"
    @Published var email: String = "test@test.com"

    
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

