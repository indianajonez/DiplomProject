//
//  User.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 18.10.2023.
//

import UIKit

class User {
    
    var login: String
    var fullName: String
    var avatar: UIImage?
    
    
    init(login: String, fullName: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = UIImage(named: "Kate")
 
    }
    
}
