//
//  DoneApp.swift
//  Done
//
//  Created by Oğuz Karatoruk on 11.07.2022.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously()
        }
        return true
    }
}

@main
struct DoneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

