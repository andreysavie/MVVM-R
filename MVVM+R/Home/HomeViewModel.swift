//
//  HomeViewModel.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import Foundation

final class HomeViewModel: ViewModel {
    
    var router: HomeRouter
        
    init(router: HomeRouter) {
        self.router = router
    }
    
    
}
