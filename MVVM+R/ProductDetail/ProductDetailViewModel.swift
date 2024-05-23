//
//  ProductDetailViewModel.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import Foundation

final class ProductDetailViewModel: ViewModel {
    
    var router: ProductDetailRouter
    
    private var product: Product?
    
    init(router: ProductDetailRouter, article: Int) {
        self.router = router
        self.fetchProductDetail(for: article)
    }
    
    func fetchProductDetail(for article: Int) {
        self.product = .init(name: "", description: "", image: "", price: 0)
    }
}
