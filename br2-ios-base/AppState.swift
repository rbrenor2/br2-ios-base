//
//  AppState.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

@MainActor
class AppState: ObservableObject {
    // General
    @Published var isLoading: Bool = false

    // Auth
    @Published var userCredentials: Any? = nil
    
    // Preferences
    @Published var preferenceList: [Preference]? = nil
    
    // User Profile
    @Published var userProfile: UserProfile? = nil
}
