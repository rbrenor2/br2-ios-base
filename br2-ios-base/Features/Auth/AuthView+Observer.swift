//
//  AuthService.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//
import SwiftUI

enum AuthType {
    case EmailPassword
    case Google
    case Apple
}

extension AuthView {
    @MainActor
    class Observed: ObservableObject {
        @EnvironmentObject var appState: AppState

        func login(type: AuthType, email: String?, password: String?) {
            appState.isLoading = true
        }
        
        func register(type: AuthType, email: String?, password: String?) {
            appState.isLoading = true
        }
    }
}

