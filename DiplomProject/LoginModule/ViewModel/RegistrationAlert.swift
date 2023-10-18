//
//  RegistrationAlert.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 18.10.2023.
//

import UIKit

class RegistrationAlert {
    //синглтон?
    static let defaultPicker = RegistrationAlert()
    
    func showSignupPicker(in viewController: UIViewController, completion: @escaping (String, String, String) -> () ) {
        let alert = UIAlertController(title: "Зарегистрироваться", message: nil, preferredStyle: .alert)
        
        // Добавляем три поля в аллерт для ввода и подтверждения регистрации пользователя
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        
        // создаем кнопку "OK" в алерте
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let text1 = alert.textFields?[0].text,
               let text2 = alert.textFields?[1].text,
               let text3 = alert.textFields?[2].text
            {
                completion(text1, text2, text3)
            }
        }
        // создаем кнопку "Отмена" в алерте
        let canelAction = UIAlertAction(title: "Отмена", style: .default)
        
        alert.addAction(okAction)
        alert.addAction(canelAction)
        
        // презентим алерт
        viewController.present(alert, animated: true)
        
    }
}
