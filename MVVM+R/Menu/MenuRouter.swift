//
//  MenuRouter.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import UIKit

class MenuRouter: BaseRouter {
        
    override func start() {
        let menuVC = MenuBuilder().build(router: self)
        navigationController.setViewControllers([menuVC], animated: true)
    }
    
}
