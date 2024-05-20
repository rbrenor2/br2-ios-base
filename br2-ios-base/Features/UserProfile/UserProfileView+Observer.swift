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

extension UserProfileView {
    class Observed: ObservableObject {
        @EnvironmentObject var appState: AppState

        func loadUserProfile() {
            appState.isLoading = true
            appState.userProfile = nil
        }
        
        func saveUserProfile(preference: Preference, completion: ()->Void?) {
            appState.isLoading = true
            completion()
        }
    }
}
