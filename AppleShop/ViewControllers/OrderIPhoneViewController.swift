//
//  OrderIPhoneViewController.swift
//  AppleShop
//
//  Created by Bohdan on 20.04.2022.
//

import UIKit

class OrderIPhoneViewController: UIViewController {
    
    var price = 999
    var modelPrice = 0
    var capacityPrice = 0
    
    var maxModel = "Max"
    
    let iphoneColorImageArray = [UIImage(named: "blue"), UIImage(named: "gold")]
    
    let iphoneColorArray = ["Sierra Blue", "Gold"]
    let iphoneCapacityArray = ["128GB", "256GB", "512GB", "1TB"]
    
    //MARK: - UI
    let mainStackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    let valueStackView: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 0
        return $0
    }(UIStackView())
    
    let labelsStackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView())
    
    let specsStackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .trailing
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView())
    
    let modelStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 20
        return $0
    }(UIStackView())
    
    var colorSegmentedControl = UISegmentedControl()
    var capacitySegmentedControl = UISegmentedControl()
    
    let shoppingCartButton: UIButton = {
        $0.setImage(UIImage(systemName: "cart"), for: .normal)
        $0.addTarget(self, action: #selector(checkOrder), for: .touchUpInside)
        return $0
    }(UIButton())
    
    let addButton: UIButton = {
        $0.setTitle("Add to cart", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        return $0
    }(UIButton())
    
    let maxSwitch: UISwitch = {
        $0.addTarget(self, action: #selector(maxMethod), for: .valueChanged)
        $0.onTintColor = .systemBlue.withAlphaComponent(0.5)
        return $0
    }(UISwitch())
    
    let iphoneImageView: UIImageView = {
        $0.image = UIImage(named: "blue")
        return $0
    }(UIImageView())

    let totalPriceLabel: UILabel = {
        $0.text = "$999"
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let modelLabel: UILabel = {
        $0.text = "Model"
        return $0
    }(UILabel())
    
    let colorLabel: UILabel = {
        $0.text = "Color"
        return $0
    }(UILabel())
    
    let capacityLabel: UILabel = {
        $0.text = "Capacity"
        return $0
    }(UILabel())
    
    let minLabel: UILabel = {
        $0.text = "Pro"
        $0.textColor = .darkGray
        return $0
    }(UILabel())
    
    let maxLabel: UILabel = {
        $0.text = "Pro Max"
        $0.textColor = .darkGray
        return $0
    }(UILabel())
    
    //MARK: - ViewLifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        navigationItem.title = "IPhone 13 Pro"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shoppingCartButton)
    }
    
    //MARK: - Methods
    @objc private func checkOrder() {
        
    }
    
    @objc private func changeColorSegment(sender: UISegmentedControl) {
        if sender == colorSegmentedControl {
            let segmentIndex = sender.selectedSegmentIndex
            iphoneImageView.image = iphoneColorImageArray[segmentIndex]
            if segmentIndex == 0 {
                sender.selectedSegmentTintColor = .systemBlue.withAlphaComponent(0.5)
            } else if segmentIndex == 1 {
                sender.selectedSegmentTintColor = .systemYellow.withAlphaComponent(0.5)
            }
        }
    }
    
    @objc private func changeCapacitrySegment(sender: UISegmentedControl) {
        if sender == capacitySegmentedControl {
            let segmentIndex = sender.selectedSegmentIndex
            
            switch segmentIndex {
            case 0:
                capacityPrice = 0
            case 1:
                capacityPrice = 100
            case 2:
                capacityPrice = 300
            default:
                capacityPrice = 500
            }
            refreshPrice()
        }
    }
    
    @objc private func maxMethod(sender: UISwitch) {
        if sender == maxSwitch {
            if sender.isOn {
                maxModel = "Max"
                modelPrice = 100
            } else {
                maxModel = ""
                modelPrice = 0
            }
            refreshPrice()
            refreshLabel()
        }
    }
    
    private func refreshPrice() {
        totalPriceLabel.text = "$\(price + capacityPrice + modelPrice)"
    }
    
    private func refreshLabel() {
        navigationItem.title = "IPhone 13 Pro \(maxModel)"
    }
    
    //MARK: - Layout
    private func createColorSegmentedControl() {
        colorSegmentedControl = UISegmentedControl(items: iphoneColorArray)
        colorSegmentedControl.selectedSegmentIndex = 0
        colorSegmentedControl.selectedSegmentTintColor = .systemBlue.withAlphaComponent(0.5)
        colorSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        colorSegmentedControl.addTarget(self, action: #selector(changeColorSegment), for: .valueChanged)
    }
    
    private func createCapacitySegmentedControl() {
        capacitySegmentedControl = UISegmentedControl(items: iphoneCapacityArray)
        capacitySegmentedControl.selectedSegmentIndex = 0
        capacitySegmentedControl.selectedSegmentTintColor = .systemBlue.withAlphaComponent(0.5)
        capacitySegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        capacitySegmentedControl.addTarget(self, action: #selector(changeCapacitrySegment), for: .valueChanged)
    }
    
    private func constraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            iphoneImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func setupLayout() {
        view.backgroundColor = .systemGray6
        view.addSubview(mainStackView)
        createColorSegmentedControl()
        createCapacitySegmentedControl()
        mainStackView.addArrangedSubview(iphoneImageView)
        mainStackView.addArrangedSubview(valueStackView)
        mainStackView.addArrangedSubview(totalPriceLabel)
        mainStackView.addArrangedSubview(addButton)
        
        valueStackView.addArrangedSubview(labelsStackView)
        valueStackView.addArrangedSubview(specsStackView)
        
        labelsStackView.addArrangedSubview(colorLabel)
        labelsStackView.addArrangedSubview(modelLabel)
        labelsStackView.addArrangedSubview(capacityLabel)
        
        specsStackView.addArrangedSubview(colorSegmentedControl)
        specsStackView.addArrangedSubview(modelStackView)
        specsStackView.addArrangedSubview(capacitySegmentedControl)
        
        modelStackView.addArrangedSubview(minLabel)
        modelStackView.addArrangedSubview(maxSwitch)
        modelStackView.addArrangedSubview(maxLabel)
        
        constraints()
    }
}
