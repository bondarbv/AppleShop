//
//  OrderViewController.swift
//  AppleShop
//
//  Created by Bohdan on 20.04.2022.
//

import UIKit

class OrderViewController: UIViewController {
    
    //MARK: - UI
    let mainStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    static let orderLabel: UILabel = {
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let orderNumberLabel: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 30)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    static let orderImageView: UIImageView = {
        return $0
    }(UIImageView())
    
    let payButton: UIButton = {
        $0.setTitle("Pay", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(pay), for: .touchUpInside)
        return $0
    }(UIButton())
    
    //MARK: - ViewLifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        navigationItem.title = "Your order"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash,
                                                            target: self,
                                                            action: #selector(clearCart))
    }
    
    //MARK: - Methods
    @objc private func clearCart() {
        if OrderViewController.orderLabel.text != nil {
            clearCartAlert(title: "Clear cart", message: "Do you really want to empty your cart?", style: .alert)
        } else if OrderViewController.orderLabel.text == nil {
            emptyCartAlert(title: "Error", message: "Your order is empty", style: .alert)
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    @objc private func pay() {
        if OrderViewController.orderLabel.text != nil {
            payAlert(title: "Your order", message: """
\(OrderViewController.orderLabel.text ?? "")
""", style: .alert)
        } else if OrderViewController.orderLabel.text == nil {
            emptyCartAlert(title: "Error", message: "Your order is empty", style: .alert)
        }
    }
    
    private func clearCartAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let ok = UIAlertAction(title: "Yes", style: .destructive) { _ in
            OrderViewController.orderLabel.text = nil
            OrderViewController.orderImageView.image = nil
            self.availableBuyButton()
        }
        let cancel = UIAlertAction(title: "No", style: .default)
        alertController.addAction(cancel)
        alertController.addAction(ok)
        present(alertController, animated: true)
    }
    
    private func emptyCartAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        present(alertController, animated: true)
    }
    
    private func payAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            OrderViewController.orderLabel.text = nil
            OrderViewController.orderImageView.image = nil
            self.orderNumberLabel.text = """
Thank you for your order!
Order number: \(Int.random(in: 0...100))
"""
            self.payButton.setTitle("", for: .normal)
            self.payButton.backgroundColor = .clear
            self.payButton.setBackgroundImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            self.payButton.tintColor = .systemGreen
            self.payButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -260).isActive = true
            self.payButton.heightAnchor.constraint(equalToConstant: 130).isActive = true
            self.payButton.isUserInteractionEnabled = false
            self.availableBuyButton()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancel)
        alertController.addAction(ok)
        present(alertController, animated: true)
    }
    
    private func availableBuyButton() {
        if OrderViewController.orderLabel.text == nil {
            OrderIPhoneViewController.addButton.setTitle("Buy", for: .normal)
            OrderIPhoneViewController.addButton.backgroundColor = .systemBlue
            OrderIPhoneViewController.addButton.isEnabled = true
        }
    }
    
    //MARK: - Layout
    private func constraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.heightAnchor.constraint(equalToConstant: 120),
            
            payButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            payButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            payButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            
            orderNumberLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            orderNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orderNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            orderNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            OrderViewController.orderImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupLayout() {
        view.backgroundColor = .systemGray6
        view.addSubview(mainStackView)
        view.addSubview(orderNumberLabel)
        view.addSubview(payButton)
        mainStackView.addArrangedSubview(OrderViewController.orderImageView)
        mainStackView.addArrangedSubview(OrderViewController.orderLabel)
        constraints()
    }
}
