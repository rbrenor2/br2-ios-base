//
//  HomeView.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var vm: HomeViewModel
    
    var body: some View {
        NavigationView {
            TabView {
                TabContentView(tabIndex: 1)
                    .tabItem {
                        Image(systemName: "1.circle")
                    }
                
                UserProfileView(vm: UserProfileViewModel(appState: appState))
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("User Profile")
                    }
                
                PreferencesView(vm: PreferencesViewModel(appState: appState))
                    .tabItem {
                        Image(systemName: "3.circle")
                        Text("Preferences")
                    }
            }.navigationBarTitle("Home", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        vm.logout()
                    }) {
                        Image(systemName: "power")
                            .foregroundColor(.red)
                    }
                )
        }
        
    }
}

struct TabContentView: View {
    let tabIndex: Int

    var body: some View {
        VStack {
            Spacer()
            Text("I am tab \(tabIndex)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

#Preview {
    let appState = AppState()
    let viewModel = HomeViewModel(appState: appState)
    return HomeView(vm: viewModel)
        .environmentObject(appState)
}
