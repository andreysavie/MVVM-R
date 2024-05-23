//
//  CartRouter.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import Foundation

class CartRouter: BaseRouter {
    
    override func start() {
        let cartVC = CartBuilder().build(router: self)
        navigationController.setViewControllers([cartVC], animated: true)
    }
    
}
