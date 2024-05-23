//
//  ViewModel.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import UIKit

protocol ViewModel: AnyObject {
    
    associatedtype SceneRouter: Router
    
    var router: SceneRouter { get set }
    
    func viewLoaded()
    func viewAppeared()
    func viewDisappeared()
}

extension ViewModel {
    func viewLoaded() {}
    func viewAppeared() { }
    func viewDisappeared() { }
}

protocol CellViewModel: AnyObject { }

protocol ViewModelConfigurable {
    func configure(with viewModel: CellViewModel)
}

protocol ViewModelBased {
    associatedtype ViewModel
    var viewModel: ViewModel! { get set }
}

extension ViewModelBased where Self: UIViewController {

    /// Метод для присвоения вью-модели контроллеру
    static func instantiate(with viewModel: ViewModel) -> Self {
        var viewController = Self()
        viewController.viewModel = viewModel
        return viewController
    }
}
