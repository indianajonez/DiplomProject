//
//  CurrentUserService.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 18.10.2023.
//

import Foundation

class CurrentUserService: UserServiceProtocol {
    
    var  user: User?
    
    init(login: String) {
        self.user = checkLogin(login: login)
    }
    
    func checkLogin(login: String) -> User? {
        login == "K" ? User(login: "K", fullName: "Ekaterina") : nil
    }
}
