//
//  TabBarViewController.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 25.10.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    let profileVC: ProfileViewController?
    //    let settingsVC = SettingsProfileViewController()
    let mediaVC = MediaPlayerViewController()
    let favorietsVC = FavorietsViewController()
    
    
    init(profileVC: ProfileViewController?) {
        self.profileVC = profileVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.tintColor = .black
        navigationItem.hidesBackButton = true
        setupControllers()
    }
    
    func setupControllers() {
        
        guard var profile = profileVC else {return}
        
        profile.tabBarItem.title = "Профайл"
        mediaVC.tabBarItem.title = "Медиа"
        favorietsVC.tabBarItem.title = "Избранное"
        
        profile.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        mediaVC.tabBarItem.image = UIImage(systemName: "play.circle")
        favorietsVC.tabBarItem.image = UIImage(systemName: "star.circle")
        
        
        let profileVC = UINavigationController(rootViewController: profile)
        let mediaVC = UINavigationController(rootViewController: mediaVC)
        let favoritesVC = UINavigationController(rootViewController: favorietsVC)
            
            //        profileVC.navigationController?.navigationBar.isHidden = true
            
        viewControllers = [profileVC, mediaVC, favoritesVC]
            
            
        }
    }
