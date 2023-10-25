//
//  UserSettings.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 24.10.2023.
//

import UIKit

class UserSettings {
    var name: String
    var aboutUser: String
    var age: String
    var photo: UIImageView
    
    init(name: String, aboutUser: String, age: String, photo: UIImageView) {
        self.name = name
        self.aboutUser = aboutUser
        self.age = age
        self.photo = photo
    }
}
