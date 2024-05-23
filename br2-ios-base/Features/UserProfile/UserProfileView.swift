//
//  UserProfileView.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var vm: UserProfileViewModel

    var body: some View {
        VStack(spacing: 20) {
            // Avatar Image
            Image(vm.userAvatarUrl)
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
            Text(appState.userProfile?.name ?? "")
                .font(.title)
                .fontWeight(.bold)
            
            // User Email
            Text(appState.user?.email ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // User Email
            Text(appState.userProfile?.accountType ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .onAppear {
            vm.loadUserProfile()
        }
    }
}

#Preview {
    let appState = AppState()
    let viewModel = UserProfileViewModel(appState: appState)
    return UserProfileView(vm: viewModel)
        .environmentObject(appState)
}
