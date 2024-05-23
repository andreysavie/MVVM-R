//
//  CartBuilder.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import Foundation

protocol CartBuilderProtocol: Builder {
    func build(router: CartRouter) -> CartViewController
}

final class CartBuilder: CartBuilderProtocol {
    
    func build(router: CartRouter) -> CartViewController {
        let cartVM = CartViewModel(router: router)
        let cartVC = CartViewController.instantiate(with: cartVM)
        cartVC.title = "Коризина"
        return cartVC
    }
    
}
