//
//  ContentView.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()
    
    var body: some View {
        AuthView()
            .environmentObject(appState)
    }
}

#Preview {
    ContentView()
}
