//
//  UserProfileView+Observer.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//
import SwiftUI
import FirebaseAuth
import Combine

@MainActor
class UserProfileViewModel: ObservableObject {
    var appState: AppState
    private let userProfileService = UserProfileService()

    @Published var userAvatarUrl: String = ""
    @Published var name: String = "John Doe"
    @Published var email: String = "test@test.com"

    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func loadUserProfile() {
        if appState.userProfile == nil {
            guard let email = appState.user!.email else { return }
            self.fetchUserProfile(email: email)
        }
    }
    
    func fetchUserProfile(email: String) {
        appState.isLoading = true
        
        userProfileService.getUserProfile(email: email)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.appState.isLoading = false
                switch completion {
                case .failure(let error):
                    self.appState.error = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { userProfile in
                self.appState.userProfile = userProfile
                print(userProfile)
                
            }
            .store(in: &cancellables)
    }

    
  
    

}

