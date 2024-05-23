//
//  SplashViewController.swift
//  MVVM+R
//
//  Created by Andrey Rybalkin on 23.05.2024.
//

import UIKit

class SplashViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = .init(systemName: "gamecontroller")?
            .withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "WELCOME!"
        label.font = UIFont.systemFont(ofSize: 42, weight: .black)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        view.addSubview(stackView)
        view.backgroundColor = .cyan
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
}
