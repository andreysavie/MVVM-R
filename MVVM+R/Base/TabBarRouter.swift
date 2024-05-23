//
//  TabBarRouter.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import UIKit

final class TabBarRouter: BaseRouter {
    
    enum Tab: Int, CaseIterable {
        case home = 0
        case cart
        case menu
        
        var title: String {
            switch self {
            case .home: return "Главная"
            case .cart: return "Корзина"
            case .menu: return "Меню"
            }
        }
        
        var image: UIImage {
            switch self {
            case .home: return UIImage(systemName: "house")!
            case .cart: return UIImage(systemName: "basket")!
            case .menu: return UIImage(systemName: "list.bullet.circle")!
            }
        }
        
        var selectedImage: UIImage {
            switch self {
            case .home: return UIImage(systemName: "house.fill")!
            case .cart: return UIImage(systemName: "basket.fill")!
            case .menu: return UIImage(systemName: "list.bullet.circle.fill")!
            }
        }
    }

    var selectedRouter: Router? {
        guard !childRouters.isEmpty,
            let index = tabBarController?.selectedIndex,
            index <= childRouters.count - 1
        else { return nil }
        
        return self.childRouters[index]
    }
    
    weak var tabBarController: UITabBarController?
    
    // MARK: - Lifecycle
    
    convenience init(window: UIWindow) {
        self.init(window: window, navigationController: .init())
    }
    
    // MARK: - Properties
                
    override func start() {
        
        let tabs = Tab.allCases

        let tabBarController = UITabBarController()
        tabBarController.delegate = self
        self.tabBarController = tabBarController
        
        self.configureTabBarAppearance()
        self.configureTabBarController(with: tabs)
        self.navigationController.configureNavBar()
 
        // preload all controllers & setup bindings after configuring tabBarController
        for viewController in self.tabBarController?.viewControllers ?? [] {
            if let navigationVC = viewController as? UINavigationController, let rootVC = navigationVC.viewControllers.first {
                let _ = rootVC.view
            } else {
                let _ = viewController.view
            }
        }
        
        self.selectTab(tab: .home)

        window.rootViewController = tabBarController
        navigationController.setViewControllers([], animated: false)
        if !window.isKeyWindow {
            window.makeKeyAndVisible()
        }
    }
        
    private func configureTabBarController(with tabs: [Tab]) {
        guard let tabBarController else { return }
        
        var navigationControllers = [UINavigationController]()
        
        for tab in tabs {
            
            let navigationController = UINavigationController()
            
            let tabBarItem = UITabBarItem(
                title: tab.title,
                image: tab.image,
                selectedImage: tab.selectedImage
            )
            tabBarItem.tag = tab.rawValue
            navigationController.tabBarItem = tabBarItem
            navigationControllers.append(navigationController)
        }

        tabBarController.viewControllers = navigationControllers
        tabBarController.selectedIndex = Tab.home.rawValue

        self.configureRouters(
            tabs: tabs,
            navigationControllers: navigationControllers
        )
    }

    func configureRouters(
        tabs: [Tab],
        navigationControllers: [UINavigationController]
    ) {
        for (tab, navigationController) in zip(tabs, navigationControllers) {
            
            var router: Router?
            
            switch tab {
                
            case .home:
                router = HomeRouter(
                    window: window,
                    navigationController: navigationController
                )
            case .cart:
                router = CartRouter(
                    window: window,
                    navigationController: navigationController
                )
            case .menu:
                router = MenuRouter(
                    window: window,
                    navigationController: navigationController
                )
            }
            
            if let router {
                store(router: router)
                router.start()
            }
        }
    }
    
    private func configureTabBarAppearance() {
        guard let tabBarController else { return }
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        
        tabBarController.view.backgroundColor = .systemBackground
        tabBarController.tabBar.shadowImage = nil
        tabBarController.tabBar.backgroundImage = nil
        tabBarController.tabBar.backgroundColor = .systemBackground
        tabBarController.tabBar.clipsToBounds = true
        tabBarController.tabBar.standardAppearance = appearance
        tabBarController.tabBar.scrollEdgeAppearance = appearance
    }

}

extension TabBarRouter {
    
    func selectTab(tab: Tab) {
        self.tabBarController?.selectedIndex = tab.rawValue
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.children
            .compactMap { $0 as? UINavigationController }
            .forEach {
                $0.viewControllers.forEach {
                    $0.hidesBottomBarWhenPushed = false
                    $0.tabBarController?.tabBar.isHidden = false
                }
            }
    }
    
    func updateCounter(_ counter: Int, tab: Tab) {
        guard counter > 0 else {
            self.tabBarController?.viewControllers?[tab.rawValue].tabBarItem.badgeValue = nil
            return
        }
        self.tabBarController?.viewControllers?[tab.rawValue].tabBarItem.badgeValue = String(counter)
    }
}

extension TabBarRouter: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

extension TabBarRouter {
    var visibleRouter: Router? {
        guard let tabBarController = self.tabBarController else { return nil }
        return self.childRouters[tabBarController.selectedIndex]
    }
}
