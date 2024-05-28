//
//  OnboardingView.swift
//  br2-ios-base
//
//  Created by Breno R R on 28/05/2024.
//

import SwiftUI
import UIOnboarding

//struct OnboardingView: View {
//    @State
//        var showingOnboarding: Bool
//    
//    var body: some View {
//        VStack {
//            Text("Hello!")
//        }.fullScreenCover(isPresented: $showingOnboarding, content: {
//            OnboardingView.init()
//                .edgesIgnoringSafeArea(.all)
//        }
//    }
//    
//    func tryPresentOnboarding() {
//            onboarding.tryPresent {
//                isOnboardingPresented = true
//            }
//        }
//}
//
//#Preview {
//    OnboardingView(isOnboardingPresented: true)
//}

struct OnboardingView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIOnboardingViewController

    func makeUIViewController(context: Context) -> UIOnboardingViewController {
        let onboardingController: UIOnboardingViewController = .init(withConfiguration: .setUp())
        onboardingController.delegate = context.coordinator
        return onboardingController
    }
    
    func updateUIViewController(_ uiViewController: UIOnboardingViewController, context: Context) {}
    
    class Coordinator: NSObject, UIOnboardingViewControllerDelegate {
        func didFinishOnboarding(onboardingViewController: UIOnboardingViewController) {
            onboardingViewController.dismiss(animated: true, completion: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        return .init()
    }
}
