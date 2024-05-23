//
//  SplashViewController.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView(image: .init(systemName: "gamecontroller"))
        image.frame = .init(x: 0, y: 0, width: 200, height: 200)
        image.center = view.center
        view.addSubview(image)
        view.backgroundColor = .cyan
    }
    
}
