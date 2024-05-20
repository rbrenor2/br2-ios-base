//
//  HomeView.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            TabContentView(tabIndex: 1)
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Tab 1")
                }

            TabContentView(tabIndex: 2)
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Tab 2")
                }

            TabContentView(tabIndex: 3)
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Tab 3")
                }
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
    HomeView()
}
