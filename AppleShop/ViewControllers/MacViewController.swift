//
//  MacViewController.swift
//  AppleShop
//
//  Created by Bohdan on 19.04.2022.
//

import UIKit

class MacViewController: UIViewController {
    
    let tabBarImage = UIImage(systemName: "desktopcomputer")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.title = "Macs"
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarItem = UITabBarItem(title: "Macs", image: tabBarImage, tag: 1)
    }
}
