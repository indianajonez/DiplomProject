//
//  Photos.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 20.10.2023.
//

import UIKit

struct Photo {
    
    //MARK: - Public Properties
    
    let image: UIImage?
    
    //MARK: - Publick methods
    
    static func makeCollectionPhotos() -> [Photo] {
        var collection: [Photo] = []
        for image in 0...13 {
            collection.append(Photo(image: UIImage(named: "\(image)")))
        }
        return collection
    }
    
    static func makeCollectioinPhotos() -> [UIImage] {
        var collection: [UIImage] = []
               for image in 0...13 {
                   collection.append( UIImage(named: "\(image)")!)
               }
               return collection
    }
}
