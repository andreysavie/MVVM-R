//
//  UINavigationController+.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import UIKit

extension UINavigationController {
    
    func configureNavBar(textColor: UIColor = .label, font: UIFont = .systemFont(ofSize: 16, weight: .medium)) {
        self.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.font: font
        ]
        self.navigationBar.barTintColor = .white
        self.navigationBar.setBackgroundImage(UIImage().withTintColor(.white), for:.default)
        self.navigationBar.shadowImage = UIImage().withTintColor(.white)
        self.navigationBar.layoutIfNeeded()
        self.navigationBar.isTranslucent = false
        self.navigationBar.backgroundColor = .white
        self.view.backgroundColor = .white
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: textColor, .font: font]
            appearance.backgroundColor = .white
            appearance.shadowImage = UIImage().withTintColor(.white)
            appearance.shadowColor = .clear
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    func restore() {
        self.navigationBar.standardAppearance = .init()
    }
    
    func makeTransparent() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = .white
        self.view.backgroundColor = .clear
    }
    
    func setBackButton(title: String) {
        let backButton = UIBarButtonItem()
        backButton.title = title
        navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }

    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
    
    func setBackImage() {
        let imgBackArrow = UIImage(systemName: "arrow.left")

        navigationBar.backIndicatorImage = imgBackArrow
        navigationBar.backIndicatorTransitionMaskImage = imgBackArrow

        navigationItem.leftItemsSupplementBackButton = true
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
}
