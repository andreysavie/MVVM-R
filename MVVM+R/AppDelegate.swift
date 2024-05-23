//
//  AppDelegate.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appRouter: AppRouter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.overrideUserInterfaceStyle = .light
        self.window = window
        
        appRouter = AppRouter(window: window)
        appRouter?.start()
        appRouter?.showSplash()
        
        return true
    }
}


