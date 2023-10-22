//
//  ProyectoCoreApp.swift
//  ProyectoCore
//
//  Created by mac20@ioslabacatlan.appleid.com on 22/10/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct ProyectoCoreApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()

    var body: some Scene {
        WindowGroup {
            if let _ = authenticationViewModel.user{
                BaseView(authenticationViewModel: authenticationViewModel)
            }else{
                ContentView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
}
