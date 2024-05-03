//
//  ViewController.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 01/05/2024.
//

import UIKit

final class TabBarViewController: UITabBarController {

        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTabItems()
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
        
    
        
        
        
        setViewControllers([mainVc, messengeVC, profileVc], animated: false)
        
    }


}

