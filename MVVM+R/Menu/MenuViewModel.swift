//
//  MenuViewModel.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import Foundation

final class MenuViewModel: ViewModel {
    
    var router: MenuRouter
    
    init(router: MenuRouter) {
        self.router = router
    }
}
