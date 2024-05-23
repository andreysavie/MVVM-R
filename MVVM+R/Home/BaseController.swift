//
//  BaseController.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import UIKit
import Combine

protocol ConfigurableView {
    func setupLayout()
    func setupConstraints()
}

class BaseController<V: ViewModel>: UIViewController, ViewModelBased, ConfigurableView {
    
    var viewModel: V!
    
    var cancellable = Set<AnyCancellable>()
    
    var isHeaderHideable: Bool { false }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        viewModel.viewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewAppeared()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewDisappeared()
    }
                
    func setupLayout() { }
    
    func setupConstraints() { }
        
}

