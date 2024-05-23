//
//  MenuBuilder.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import Foundation

protocol MenuBuilderProtocol: Builder {
    func build(router: MenuRouter) -> MenuViewController
}

final class MenuBuilder: MenuBuilderProtocol {
    
    func build(router: MenuRouter) -> MenuViewController {
        let menuVM = MenuViewModel(router: router)
        let menuVC = MenuViewController.instantiate(with: menuVM)
        menuVC.title = "Меню"
        return menuVC
    }
}
