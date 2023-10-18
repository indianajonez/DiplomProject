//
//  LoginViewControllerDelegateError.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 18.10.2023.
//

import Foundation

enum LoginViewControllerDelegateError: Error {
    case loginIsEmpty
    case passIsEmpty
    case invalidLogin
    case invalidPass
    
    var errorDescription: String {
        switch self {
        case .loginIsEmpty:
            return "Вы не ввели логин"
        case .passIsEmpty:
            return "Вы не ввелги пароль"
        case .invalidLogin:
            return "Неправильный логин"
        case .invalidPass:
            return "Неправильный пароль"
        }
    }
}
