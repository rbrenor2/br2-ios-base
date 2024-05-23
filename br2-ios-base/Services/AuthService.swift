//
//  AuthService.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import FirebaseAuth
import Combine

struct AuthService {
//    func loginWithEmailAndPassword(email: String, password: String) -> User {
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//            guard let user = authResult?.user else { return }
//            
//            return user
//        }
//    }
    
    func loginWithEmailAndPassword(email: String, password: String) -> AnyPublisher<User, Error> {
        Future { promise in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    promise(.failure(error))
                } else if let user = authResult?.user {
                    promise(.success(user))
                } else {
                    promise(.failure(NSError(domain: "AuthService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func loginWithGoogle() -> Void { }
    func loginWithApple() -> Void { }
    
    func logout() -> Void {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
