//
//  HomeRouter.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import UIKit

class HomeRouter: BaseRouter {
        
    override func start() {
        let homeVC = HomeBuilder().build(router: self)
        homeVC.title = "Главный экран"
        navigationController.setViewControllers([homeVC], animated: true)
    }
    
    
    func showProductDetail(article: Int) {

        let productDetailRouter = ProductDetailRouter(
            window: window,
            navigationController: navigationController
        )
        let detailVC = ProductDetailBuilder().build(
            router: productDetailRouter,
            article: article
        )
        navigationController.pushViewController(detailVC, animated: true)
    }
}
