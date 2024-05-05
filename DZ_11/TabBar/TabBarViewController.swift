//
//  ViewController.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 01/05/2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    private let customTabBar = CustomTabBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue(customTabBar, forKey: "tabBar")
        setupTabItems()
        //   navigationItem.hidesBackButton = true
        
        
    }
    
    
    
    private func setupTabItems() {
        
        let mainVc = MainViewController()
        mainVc.tabBarItem.title = "Main"
        mainVc.tabBarItem.image = UIImage(systemName: "house")
        mainVc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        let messengeVC = MessengeViewController()
        messengeVC.tabBarItem.title = "Message"
        messengeVC.tabBarItem.image = UIImage(systemName: "message")
        messengeVC.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        
        let profileVc = ProfileViewController()
        profileVc.tabBarItem.title = "Profile"
        profileVc.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        profileVc.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill")
        
        let nev1 = UINavigationController(rootViewController: mainVc)
        let nev2 = UINavigationController(rootViewController: messengeVC)
        let nev3 = UINavigationController(rootViewController: profileVc)
        
        setViewControllers([nev1, nev2, nev3], animated: false)
        
        
    }
    

    
}
