//
//  UserProfileService.swift
//  br2-ios-base
//
//  Created by Breno R R on 23/05/2024.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift


struct UserProfileService {
    static var shared = UserProfileService()
    
    private init() { }
    
    private let db = Firestore.firestore()
    private let resourcePath = "userProfiles"
    
    func getUserProfile(email: String) -> AnyPublisher<UserProfile, Error> {
        Future { promise in
            let docRef = self.db.collection(self.resourcePath).document(email)
            
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    do {
                        let userProfile = try document.data(as: UserProfile.self)
                                                promise(.success(userProfile))
                    } catch {
                        promise(.failure(error))
                    }
                } else {
                    let error = GeneralError.documentNotFound
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
