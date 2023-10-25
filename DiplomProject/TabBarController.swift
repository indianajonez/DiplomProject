//
//  TabBarViewController.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 25.10.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    let profileVC = ProfileViewController(user: User(login: "", fullName: ""))
    let settingsVC = SettingsProfileViewController()
    let mediaVC = MediaPlayerViewController()
    let favorietsVC = FavorietsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    func setupControllers() {
        profileVC.tabBarItem.title = "Профайл"
        settingsVC.tabBarItem.title = "Настройки"
        mediaVC.tabBarItem.title = "Медиа"
        favorietsVC.tabBarItem.title = "Избранное"
        
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        settingsVC.tabBarItem.image = UIImage(systemName: "rectangle.3.group.bubble.left")
        mediaVC.tabBarItem.image = UIImage(systemName: "player")
        favorietsVC.tabBarItem.image = UIImage(systemName: "star")
        
        let profileVC = UINavigationController(rootViewController: profileVC)
        let settingsVC = UINavigationController(rootViewController: settingsVC)
        let mediaVC = UINavigationController(rootViewController: mediaVC)
        let favoritesVC = UINavigationController(rootViewController: favorietsVC)
        
        profileVC.navigationController?.navigationBar.isHidden = true
        
        viewControllers = [profileVC, settingsVC, mediaVC, favoritesVC]
    }
}
