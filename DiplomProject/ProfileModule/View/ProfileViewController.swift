//
//  ProfileViewController.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 18.10.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private let user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.title = "ProfileView comming soon:)"
        navigationItem.hidesBackButton = true
        print(user?.fullName ?? "Not full name")
    }
    

    init(user: User?) {
        self.user = user
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
