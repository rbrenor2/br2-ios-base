//
//  HomeView+Observer.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI
import FirebaseAuth
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    var appState: AppState
    let authService: AuthService = AuthService()

    @Published var something: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState) {
        self.appState = appState
//        setupBindings()
    }
    
    func logout() {
        authService.logout()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error logging out: \(error.localizedDescription)")
                }
            }, receiveValue: { success in
                if success {
                    self.appState.isLoggedIn = false
                }
            })
            .store(in: &cancellables)
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
