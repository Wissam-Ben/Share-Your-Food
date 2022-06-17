//
//  MealCategory.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/06/2022.
//

import Foundation

class MealCategory {
    init(id: Int, name: String, thumb: URL, description: String) {
        self.id = id
        self.name = name
        self.thumb = thumb
        self.description = description
    }
    
    var id: Int
    var name: String
    var thumb: URL
    var description: String
    
    
    
    convenience init?(dict: [String: Any]) {
        guard let meal = dict["categories"] as? [String: Any],
              let id = meal["idCategory"] as? Int,
              let name = meal["strCategory"] as? String,
              let thumb = meal["strCategoryThumb"] as? URL,
              let description = meal["strCategoryDescription"] as? String else {
            return nil
        }
        self.init(id: id, name: name, thumb: thumb, description: description)
    }
}
