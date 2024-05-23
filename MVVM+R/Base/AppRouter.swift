//
//  AppRouter.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import UIKit

final class AppRouter: BaseRouter {
    
    // MARK: - Properties

    var splashWindow: UIWindow?
    
    // MARK: - Lifecycle
    
    convenience init(window: UIWindow) {
        self.init(window: window, navigationController: .init())
    }

    // MARK: - Properties

    override func start() {
        if let child = provideFirstRouter() {
            self.setChild(child: child)
        }
        if !window.isKeyWindow {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    func showSplash() {
        splashWindow = UIWindow(frame: UIScreen.main.bounds)
        splashWindow?.rootViewController = SplashViewController()
        splashWindow?.overrideUserInterfaceStyle = .light
        splashWindow?.windowLevel = .alert
        splashWindow?.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: { [weak self] in
            self?.hideSplash()
        })
    }
    
    func hideSplash() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.splashWindow?.alpha = 0
        }, completion: { [weak self] _ in
            self?.splashWindow?.isHidden = true
            self?.splashWindow = nil
        })
    }
    
    private func setChild(child: Router) {
        self.store(router: child)
        child.start()
    }
    
    func provideFirstRouter() -> Router? {
        return TabBarRouter(window: window)
    }
}
