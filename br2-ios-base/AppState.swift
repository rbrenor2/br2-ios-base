//
//  AppState.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI
import FirebaseAuth

@MainActor
class AppState: ObservableObject {
    // General
    @Published var isLoading: Bool = false
    @Published var error: String? = nil

    // Auth
    @Published var user: User? = nil
    @Published var isLoggedIn: Bool = false
    
    // Preferences
    @Published var preferences: [Preference]? = nil
    @Published var preferencesDefinition: [PreferenceDefinition]? = nil

    // User Profile
    @Published var userProfile: UserProfile? = nil
}
