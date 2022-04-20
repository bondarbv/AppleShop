//
//  ViewController.swift
//  AppleShop
//
//  Created by Bohdan on 19.04.2022.
//

import UIKit

class IPhoneViewController: UIViewController {
    
    //MARK: - UI
    let iphoneStackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    let iphoneLabel: UILabel = {
        $0.text = "IPhone 13"
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let iphoneSubtitle: UILabel = {
        $0.text = "Oh. So. Pro."
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let priceLabel: UILabel = {
        $0.text = "From $999"
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let iphoneImageView: UIImageView = {
        $0.image = UIImage(named: "iphones")
        return $0
    }(UIImageView())
    
    let buyButton: UIButton = {
        $0.setTitle("Buy", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        $0.addTarget(self, action: #selector(buy), for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    //MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        navigationItem.title = "IPhones"
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarItem = UITabBarItem(title: "IPhones", image: UIImage(systemName: "iphone"), tag: 0)
    }
    
    //MARK: - Methods
    
    @objc private func buy(sender: UIButton) {
        if sender == buyButton {
            let vc = OrderIPhoneViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: - Layout
    private func constraints() {
        NSLayoutConstraint.activate([
            iphoneStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            iphoneStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            iphoneStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            iphoneImageView.widthAnchor.constraint(equalToConstant: 400),
            iphoneImageView.heightAnchor.constraint(equalToConstant: 322)
        ])
    }

    private func setupLayout() {
        view.backgroundColor = .systemGray6
        view.addSubview(iphoneStackView)
        iphoneStackView.addArrangedSubview(iphoneLabel)
        iphoneStackView.addArrangedSubview(iphoneSubtitle)
        iphoneStackView.addArrangedSubview(iphoneImageView)
        iphoneStackView.addArrangedSubview(priceLabel)
        iphoneStackView.addArrangedSubview(buyButton)
        constraints()
        iphoneStackView.setCustomSpacing(0, after: iphoneLabel)
    }
}

