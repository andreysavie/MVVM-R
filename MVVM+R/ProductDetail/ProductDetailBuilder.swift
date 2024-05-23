//
//  ProductDetailBuilder.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import Foundation

protocol ProtuctDetailBuilderProtocol: Builder {
    func build(router: ProductDetailRouter, article: Int) -> ProductDetailViewController
}

final class ProductDetailBuilder: ProtuctDetailBuilderProtocol {
    
    func build(router: ProductDetailRouter, article: Int) -> ProductDetailViewController {
        let detailVM = ProductDetailViewModel(router: router, article: article)
        let detailVC = ProductDetailViewController.instantiate(with: detailVM)
        return detailVC
    }
    
}
