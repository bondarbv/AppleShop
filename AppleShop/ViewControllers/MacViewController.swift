//
//  MacViewController.swift
//  AppleShop
//
//  Created by Bohdan on 19.04.2022.
//

import UIKit

class MacViewController: UIViewController {
    
    //MARK: - UI
    let macStackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    let macLabel: UILabel = {
        $0.text = "Macbook Pro"
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let macSubtitle: UILabel = {
        $0.text = "Supercharged for pros."
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let priceLabel: UILabel = {
        $0.text = "From $1999"
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let macImageView: UIImageView = {
        $0.image = UIImage(named: "macbook")
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
        navigationItem.title = "Macs"
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarItem = UITabBarItem(title: "Macs", image: UIImage(systemName: "desktopcomputer"), tag: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: OrderIPhoneViewController().shoppingCartButton)
    }
    
    //MARK: - Methods
    @objc private func buy(sender: UIButton) {
        if sender == buyButton {
            createAlertController(title: "Sorry", message: "This product is currently out of stock. You can leave an email and we will notify you of product availability", style: .alert)
        }
    }
    
    private func createAlertController(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            _ = alertController.textFields?.first
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addTextField()
        alertController.addAction(ok)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    
    //MARK: - Layout
    private func constraints() {
        NSLayoutConstraint.activate([
            macStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            macStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            macStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            macImageView.heightAnchor.constraint(equalToConstant: 322)
        ])
    }
    
    private func setupLayout() {
        view.backgroundColor = .systemGray6
        view.addSubview(macStackView)
        macStackView.addArrangedSubview(macLabel)
        macStackView.addArrangedSubview(macSubtitle)
        macStackView.addArrangedSubview(macImageView)
        macStackView.addArrangedSubview(priceLabel)
        macStackView.addArrangedSubview(buyButton)
        constraints()
        macStackView.setCustomSpacing(0, after: macLabel)
    }
    
}
