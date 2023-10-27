//
//  TabBarViewController.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 25.10.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    let profileVC = ProfileViewController(user: User(login: "", fullName: ""))
    //    let settingsVC = SettingsProfileViewController()
    let mediaVC = MediaPlayerViewController()
    let favorietsVC = FavorietsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.tintColor = .black
        setupControllers()
    }
    
    func setupControllers() {
        profileVC.tabBarItem.title = "Профайл"
        mediaVC.tabBarItem.title = "Медиа"
        favorietsVC.tabBarItem.title = "Избранное"
        
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        mediaVC.tabBarItem.image = UIImage(systemName: "play.circle")
        favorietsVC.tabBarItem.image = UIImage(systemName: "star.circle")
        
//        [profileVC, mediaVC, favorietsVC].forEach { (v) in
//            v.textColor = .black
            
            let profileVC = UINavigationController(rootViewController: profileVC)
            let mediaVC = UINavigationController(rootViewController: mediaVC)
            let favoritesVC = UINavigationController(rootViewController: favorietsVC)
            
            //        profileVC.navigationController?.navigationBar.isHidden = true
            
            viewControllers = [profileVC, mediaVC, favoritesVC]
            
            
        }
    }
