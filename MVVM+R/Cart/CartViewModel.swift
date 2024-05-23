//
//  CartViewModel.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import Foundation

final class CartViewModel: ViewModel {
    
    var router: CartRouter
    
    init(router: CartRouter) {
        self.router = router
    }
    
}
