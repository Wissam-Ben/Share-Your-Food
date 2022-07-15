//
//  Recipe.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

class PlateRecipe {
    
    var id: Int
    var name: String
    var ingredient: String
    var note: String
    
    internal init(id: Int, name: String, ingredient: String, note: String) {
        self.id = id
        self.name = name
        self.ingredient = ingredient
        self.note = note
    }
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let name = dict["name"] as? String,
              let ingredient = dict["ingredient"] as? String,
              let note = dict["note"] as? String else {
            return nil
        }
        self.init(id: id, name: name, ingredient: ingredient, note: note)
    }
}
