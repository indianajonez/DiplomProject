//
//  Post2.swift
//  DiplomProject
//
//  Created by Ekaterina Saveleva on 20.10.2023.
//

import UIKit

public struct Post {
//    public var id: String
    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int
    
    
    public init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
        
    }
}
//        public init(data: NSManagedObject) {
//            self.id = (data.value(forKey: "id") as? String)!
//            self.author = (data.value(forKey: "author") as? String)!
//            self.description = (data.value(forKey: "desc") as? String)!
//            self.image = (data.value(forKey: "image") as? String)!
//            self.likes = (data.value(forKey: "likes") as? Int)!
//            self.views = (data.value(forKey: "views") as? Int)!
//
//        }
    //}
    
    public struct Post2 {
        
//        static var id = 0
//        public let id: Int
        public let image: UIImage?
        
        public init(image: UIImage?) {
            self.image = image
        }
    }
    
    extension Post2 {
        
        public static func make() -> [Post] {
            
            return [
                Post(author: "Марк", description: "I haven't eaten anything yet today.", image: "Марк", likes: 10, views: 320), //id: "12"
                Post(author: "Илон", description: "I've been silent all day. It's hard.", image: "Илон", likes: 10, views: 320), //id: "23"
                Post(author: "Тим", description: "Fleas and ticks are the worst enemies.", image: "Тим", likes: 10, views: 320), //id: "45"
                Post(author: "Роберт", description: "Running after the tail. I haven't caught it yet.", image: "Роберт", likes: 10, views: 320) //id: "56",
                
                
            ]
        }
    }
