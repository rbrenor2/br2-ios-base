//
//  PreferencesView.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct PreferenceView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var vm: PreferenceViewModel
    
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
            Text(preference.displayName ?? "")
                .font(.headline)
            Spacer()
            switch preference.type {
            case PreferenceType.TEXT_INPUT.rawValue:
                TextField("Enter \(preference.displayName ?? "")", text: Binding(
                    get: { preference.valueText ?? "" },
                    set: { newValue in self.updatePreference(at: preference, with: newValue) }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
                
            case PreferenceType.DATE_INPUT.rawValue:
                TextField("Enter \(preference.displayName ?? "")", text: Binding(
                    get: { preference.valueText ?? "" },
                    set: { newValue in self.updatePreference(at: preference, with: newValue) }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
                
            case PreferenceType.TOGGLE.rawValue:
                Toggle(isOn: Binding(
                    get: { preference.valueBool ?? false },
                    set: { newValue in self.updatePreference(at: preference, with: newValue) }
                )) {
                    Text("")
                }
                
            case PreferenceType.INTEGER_INPUT.rawValue:
                TextField("Enter \(preference.displayName ?? "")", value: Binding(
                    get: { preference.valueInt ?? 0 },
                    set: { newValue in self.updatePreference(at: preference, with: newValue) }
                ), formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 100)
                .keyboardType(.numberPad)
                
            case PreferenceType.FLOAT_INPUT.rawValue:
                TextField("Enter \(preference.displayName ?? "")", value: Binding(
                    get: { preference.valueFloat ?? 0 },
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
        .onAppear(perform: {
            vm.loadPreferences()
        })
    }
    
    private func getToggleField(preference: Preference) -> any View {
        return Toggle(isOn: Binding(
            get: { preference.valueBool ?? false },
            set: { newValue in self.updatePreference(at: preference, with: newValue) }
        )) {
            Text("")
        }
    }
    
    private func getTextField(preference: Preference) -> any View {
        return Toggle(isOn: Binding(
            get: { preference.valueBool ?? false },
            set: { newValue in self.updatePreference(at: preference, with: newValue) }
        )) {
            Text("")
        }
    }

    private func updatePreference(at preference: Preference, with newValue: Any) {
        if let index = vm.preferences.firstIndex(where: { $0.displayName == preference.displayName }) {
            
            switch preference.type {
            case PreferenceType.TEXT_INPUT.rawValue:
                vm.preferences[index].valueText = newValue as? String ?? ""
                
            case PreferenceType.DATE_INPUT.rawValue:
                vm.preferences[index].valueText = newValue as? String
                
            case PreferenceType.TOGGLE.rawValue:
                vm.preferences[index].valueBool = newValue as? Bool
                
            case PreferenceType.INTEGER_INPUT.rawValue:
                vm.preferences[index].valueInt = newValue as? Int
                
            case PreferenceType.FLOAT_INPUT.rawValue:
                vm.preferences[index].valueFloat = newValue as? Float
            
            default:
                vm.preferences[index].valueText = newValue as? String
            }
        }
    }
}

#Preview {
    let appState = AppState()
    let viewModel = PreferenceViewModel(appState: appState)
    return PreferenceView(vm: viewModel)
        .environmentObject(appState)
}
