//
//  HomeBuilder.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import Foundation

protocol HomeBuilderProtocol: Builder {
    func build(router: HomeRouter) -> HomeViewController
}

final class HomeBuilder: HomeBuilderProtocol {
    
    func build(router: HomeRouter) -> HomeViewController {
        let homeVM = HomeViewModel(router: router)
        let homeVC = HomeViewController.instantiate(with: homeVM)
        return homeVC
    }
    
}
