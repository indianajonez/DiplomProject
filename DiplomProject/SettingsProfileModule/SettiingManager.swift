//
//  SettiingManager.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 29.10.2023.
//

import UIKit


final class SettingManager {
    
    static let shared: SettingManager = SettingManager()
    
    var name: String?
    var image: UIImage?
    var age: String?
    var aboutUser: String?
    
    var isNeedUpdate: Bool = false
    
    private init() {}
    
}
