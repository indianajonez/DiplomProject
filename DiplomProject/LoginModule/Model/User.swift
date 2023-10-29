//
//  User.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 18.10.2023.
//

import UIKit

class User {
    
    var login: String
    var name: String?
    var fullName: String?
    var avatar: UIImage?
    var age: String?
    var aboutUser: String?
    
    
    init(login: String, fullName: String, avatar: UIImage = UIImage(), age: String = " ", aboutUser: String = " ", name: String = " ") {
        self.name = name
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.aboutUser = aboutUser
        self.age = age
 
    }
    
}
