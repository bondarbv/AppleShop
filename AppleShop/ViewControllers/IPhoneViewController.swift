//
//  ViewController.swift
//  AppleShop
//
//  Created by Bohdan on 19.04.2022.
//

import UIKit

class IPhoneViewController: UIViewController {
    
    let tabBarImage = UIImage(systemName: "iphone")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.title = "IPhones"
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarItem = UITabBarItem(title: "IPhones", image: tabBarImage, tag: 0)
    }
}

