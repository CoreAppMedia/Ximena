//
//  AnimatedTabBarApp.swift
//  AnimatedTabBar
//
//  Created by ximena juana mejia jacobo on 21/10/23.
//

import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("Permisos de notificación concedidos")
            } else if let error = error {
                print("Error al solicitar permisos de notificación: \(error)")
            }
        }

        UNUserNotificationCenter.current().delegate = self

        return true
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
            // La notificación se tocó para abrir la aplicación
            // Puedes realizar acciones específicas aquí si es necesario
            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: ContentView())
        }

        completionHandler()
    }
    
}




@main
struct AnimatedTabBarApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
