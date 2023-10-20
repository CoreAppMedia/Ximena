//
//  CareApp.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 18/10/23.
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
struct CareApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            if let user = authenticationViewModel.user{
                HomeView(authenticationViewMondel: authenticationViewModel)
            }else{
                AuthenticationView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
}
