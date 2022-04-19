//
//  AppDelegate.swift
//  AppleShop
//
//  Created by Bohdan on 19.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let firstVC = IPhoneViewController()
        let secondVC = MacViewController()
        
        let firstNC = UINavigationController(rootViewController: firstVC)
        let secondNC = UINavigationController(rootViewController: secondVC)
        
        let tabBarVC = UITabBarController()
        
        tabBarVC.setViewControllers([firstNC, secondNC], animated: true)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        
        return true
    }
}

