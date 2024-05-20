//
//  UserProfileView.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct UserProfileView: View {
    var userName: String
    var userEmail: String
    var userAvatar: String

    var body: some View {
        VStack(spacing: 20) {
            // Avatar Image
            Image(userAvatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4)
                )
                .shadow(radius: 10)
                .padding(.top, 50)
            
            // User Name
            Text(userName)
                .font(.title)
                .fontWeight(.bold)
            
            // User Email
            Text(userEmail)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    UserProfileView(userName: "John Doe", userEmail: "john.doe@example.com", userAvatar: "profileImage")
}
