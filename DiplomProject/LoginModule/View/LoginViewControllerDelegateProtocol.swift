//
//  LoginViewControllerDelegateProtocol.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 18.10.2023.
//

import Foundation

protocol LoginViewControllerDelegateProtocol {
    func check(login: String?, password: String?) throws -> User
    func register(login: String, password: String) throws -> User
}

