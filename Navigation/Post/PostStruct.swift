//
//  Post.swift
//  Navigation
//
//  Created by antonfrolov on 05.04.2022.
//

import Foundation
import UIKit

struct Post {
    
    var title: String
    var description: String
    var author: String
    var image: UIImage?
    var likes: Int
    var views: Int
    
    static func presetData() -> [Post] {
        var result = [Post]()
        
        result.append(Post(title: "First post", description: "First desciption", author: "Ponch", image: UIImage(named:"ponch"), likes: 100500, views: 100500))
        result.append(Post(title: "Second post", description: "Second desciption", author: "Ponch", image: UIImage(named:"ponch"), likes: 10000, views: 10000))
        result.append(Post(title: "Third post", description: "Third desciption", author: "Ponch", image: UIImage(named:"ponch"), likes: 1000, views: 1000))
        result.append(Post(title: "Yet another post", description: "Yet another desciption", author: "Zver", likes: 666, views: 666))
        
        
        return result
    }
}
