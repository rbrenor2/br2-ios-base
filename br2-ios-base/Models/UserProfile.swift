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
    var showOnboarding: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case accountType
        case showOnboarding
    }
}

enum AccountPlanType {
    case Free
}

struct AccountPlan {
    let displayName: String
    let type: AccountPlanType
}
