//
//  UserProfile.swift
//  br2-ios-base
//
//  Created by Breno R R on 23/05/2024.
//
import FirebaseFirestoreSwift

struct UserProfile: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var accountType: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case accountType
    }
}

enum UserProfileError: Error {
    case documentNotFound
    case invalidData
    case unknownError
}

enum AccountPlanType {
    case Free
}

struct AccountPlan {
    let displayName: String
    let type: AccountPlanType
}
