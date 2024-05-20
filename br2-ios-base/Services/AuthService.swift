//
//  AuthService.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import Foundation

struct UserCredential {
    let displayName: String
    let email: String
}

struct AuthService {
    func loginWithEmailAndPassword(email: String, password: String) -> Void { }
    func loginWithGoogle() -> Void { }
    func loginWithApple() -> Void { }
}
