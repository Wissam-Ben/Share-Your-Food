//
//  MealCategory.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/06/2022.
//

import Foundation

class MealCategory {
    init(id: Int, name: String, description: String, thumb: String) {
        self.id = id
        self.name = name
        self.description = description
        self.thumb = thumb
    }
    
    var id: Int
    var name: String
    var thumb: String
    var description: String
    
    // let meal = dict["categories"] as? [String: Any],
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["idCategory"] as? String,
              let name = dict["strCategory"] as? String,
              let description = dict["strCategoryDescription"] as? String,
              let thumb = dict["strCategoryThumb"] as? String else {
            return nil
        }
        self.init(id: 0, name: name, description: description, thumb: thumb)
    }
}
