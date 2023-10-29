//
//  Friends.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 29.10.2023.
//

import UIKit

struct Friends {
    
    //MARK: - Public Properties
    
    let image: UIImage?
    
    //MARK: - Publick methods
    
    static func makeCollectionFriends() -> [Friends] {
        var collection: [Friends] = []
        for image in 14...18 {
            collection.append(Friends(image: UIImage(named: "\(image)")))
        }
        return collection
    }
    
    static func makeCollectionFriends() -> [UIImage] {
        var collection: [UIImage] = []
               for image in 14...18 {
                   collection.append( UIImage(named: "\(image)")!)
               }
               return collection
    }
}

