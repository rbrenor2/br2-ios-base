//
//  br2_ios_baseApp.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck
import SuperwallKit

//7B083EA1-94D8-422E-8769-803B0F324EEE
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
      let providerFactory = AppCheckDebugProviderFactory()
      AppCheck.setAppCheckProviderFactory(providerFactory)

      FirebaseApp.configure()
      Superwall.configure(apiKey: "pk_04d7bd4136ae4d1f8316f64d24461eceb39ab1fd732d87ba")

    return true
  }
}

@main
struct br2_ios_baseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
