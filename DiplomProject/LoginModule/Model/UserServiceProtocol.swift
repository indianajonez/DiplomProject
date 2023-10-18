//
//  UserServiceProtocol.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 18.10.2023.
//

import UIKit

protocol UserServiceProtocol {
    func checkLogin(login: String) -> User?
}
