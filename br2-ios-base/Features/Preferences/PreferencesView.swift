//
//  PreferencesView.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var vm: PreferencesViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.preferences.indices, id: \.self) { index in
                    self.preferenceView(for: vm.preferences[index])
                }
            }
            .navigationTitle("Preferences")
        }
    }
    
    @ViewBuilder
    private func preferenceView(for preference: Preference) -> some View {
        HStack {
            Text(preference.displayName)
                .font(.headline)
            Spacer()
            switch preference.value {
            case is String:
                TextField("Enter \(preference.displayName)", text: Binding(
                    get: { preference.value as? String ?? "" },
                    set: { newValue in self.updatePreference(at: preference, with: newValue) }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
                
            case is Bool:
                Toggle(isOn: Binding(
                    get: { preference.value as? Bool ?? false },
                    set: { newValue in self.updatePreference(at: preference, with: newValue) }
                )) {
                    Text("")
                }
                
            case is Int:
                TextField("Enter \(preference.displayName)", value: Binding(
                    get: { preference.value as? Int ?? 0 },
                    set: { newValue in self.updatePreference(at: preference, with: newValue) }
                ), formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 100)
                .keyboardType(.numberPad)
                
            default:
                Text("Unsupported type")
            }
        }
        .padding(.vertical, 8)
    }

    private func updatePreference(at preference: Preference, with newValue: Any) {
        if let index = vm.preferences.firstIndex(where: { $0.displayName == preference.displayName }) {
            vm.preferences[index].value = newValue
        }
    }
}

#Preview {
    let appState = AppState()
    let viewModel = PreferencesViewModel(appState: appState)
    return PreferencesView(vm: viewModel)
        .environmentObject(appState)
}
