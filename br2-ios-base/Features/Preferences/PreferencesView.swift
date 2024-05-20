//
//  PreferencesView.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct PreferencesView: View {
    @State private var preferences: [Preference] = [
        Preference(id: "aosidjaos-erferfid-erfknj" ,displayName: "Username", type: String.self, value: "John Doe"),
        Preference(id: "34tegr-eroiufn-erf", displayName: "Notifications", type: Bool.self, value: true),
        Preference(id: "neoijfe-804ro3ji-erf", displayName: "Age", type: Int.self, value: 30)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(preferences.indices, id: \.self) { index in
                    self.preferenceView(for: self.preferences[index])
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
        if let index = preferences.firstIndex(where: { $0.displayName == preference.displayName }) {
            preferences[index].value = newValue
        }
    }
}

#Preview {
    PreferencesView()
}
