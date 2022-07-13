//
//  MealRecipe.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/06/2022.
//

import Foundation

class MealRecipe {
    
    init(id: String, name: String, category: String, area: String, instructions: String, thumb: String, ingredient1: String, ingredient2: String, ingredient3: String, ingredient4: String, ingredient5: String, ingredient6: String, ingredient7: String, ingredient8: String, ingredient9: String, ingredient10: String, ingredient11: String, ingredient12: String, ingredient13: String, ingredient14: String, ingredient15: String, measure1: String, measure2: String, measure3: String, measure4: String, measure5: String, measure6: String, measure7: String, measure8: String, measure9: String, measure10: String, measure11: String, measure12: String, measure13: String, measure14: String, measure15: String) {
        self.id = id
        self.name = name
        self.category = category
        self.area = area
        self.instructions = instructions
        self.thumb = thumb
        //self.youtube = youtube
        self.ingredient1 = ingredient1
        self.ingredient2 = ingredient2
        self.ingredient3 = ingredient3
        self.ingredient4 = ingredient4
        self.ingredient5 = ingredient5
        self.ingredient6 = ingredient6
        self.ingredient7 = ingredient7
        self.ingredient8 = ingredient8
        self.ingredient9 = ingredient9
        self.ingredient10 = ingredient10
        self.ingredient11 = ingredient11
        self.ingredient12 = ingredient12
        self.ingredient13 = ingredient13
        self.ingredient14 = ingredient14
        self.ingredient15 = ingredient15
        self.measure1 = measure1
        self.measure2 = measure2
        self.measure3 = measure3
        self.measure4 = measure4
        self.measure5 = measure5
        self.measure6 = measure6
        self.measure7 = measure7
        self.measure8 = measure8
        self.measure9 = measure9
        self.measure10 = measure10
        self.measure11 = measure11
        self.measure12 = measure12
        self.measure13 = measure13
        self.measure14 = measure14
        self.measure15 = measure15
    }
    
    var id: String
    var name: String
    var category: String
    var area: String
    var instructions: String
    var thumb: String
    var ingredient1: String
    var ingredient2: String
    var ingredient3: String
    var ingredient4: String
    var ingredient5: String
    var ingredient6: String
    var ingredient7: String
    var ingredient8: String
    var ingredient9: String
    var ingredient10: String
    var ingredient11: String
    var ingredient12: String
    var ingredient13: String
    var ingredient14: String
    var ingredient15: String
    var measure1: String
    var measure2: String
    var measure3: String
    var measure4: String
    var measure5: String
    var measure6: String
    var measure7: String
    var measure8: String
    var measure9: String
    var measure10: String
    var measure11: String
    var measure12: String
    var measure13: String
    var measure14: String
    var measure15: String
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["idMeal"] as? String,
              let name = dict["strMeal"] as? String,
              let category = dict["strCategory"] as? String,
              let area = dict["strArea"] as? String,
              let instructions = dict["strInstructions"] as? String,
              let thumb = dict["strMealThumb"] as? String,
              let ingredient1 = dict["strIngredient1"] as? String,
              let ingredient2 = dict["strIngredient2"] as? String,
              let ingredient3 = dict["strIngredient3"] as? String,
              let ingredient4 = dict["strIngredient4"] as? String,
              let ingredient5 = dict["strIngredient5"] as? String,
              let ingredient6 = dict["strIngredient6"] as? String,
              let ingredient7 = dict["strIngredient7"] as? String,
              let ingredient8 = dict["strIngredient8"] as? String,
              let ingredient9 = dict["strIngredient9"] as? String,
              let ingredient10 = dict["strIngredient10"] as? String,
              let ingredient11 = dict["strIngredient11"] as? String,
              let ingredient12 = dict["strIngredient12"] as? String,
              let ingredient13 = dict["strIngredient13"] as? String,
              let ingredient14 = dict["strIngredient14"] as? String,
              let ingredient15 = dict["strIngredient15"] as? String,
              let measure1 = dict["strMeasure1"] as? String,
              let measure2 = dict["strMeasure2"] as? String,
              let measure3 = dict["strMeasure3"] as? String,
              let measure4 = dict["strMeasure4"] as? String,
              let measure5 = dict["strMeasure5"] as? String,
              let measure6 = dict["strMeasure6"] as? String,
              let measure7 = dict["strMeasure7"] as? String,
              let measure8 = dict["strMeasure8"] as? String,
              let measure9 = dict["strMeasure9"] as? String,
              let measure10 = dict["strMeasure10"] as? String,
              let measure11 = dict["strMeasure11"] as? String,
              let measure12 = dict["strMeasure12"] as? String,
              let measure13 = dict["strMeasure13"] as? String,
              let measure14 = dict["strMeasure14"] as? String,
              let measure15 = dict["strMeasure15"] as? String else {
            return nil
        }
        self.init(id: id, name: name, category: category, area: area, instructions: instructions, thumb: thumb, ingredient1: ingredient1, ingredient2: ingredient2, ingredient3: ingredient3, ingredient4: ingredient4, ingredient5: ingredient5, ingredient6: ingredient6, ingredient7: ingredient7, ingredient8: ingredient8, ingredient9: ingredient9, ingredient10: ingredient10, ingredient11: ingredient11, ingredient12: ingredient12, ingredient13: ingredient13, ingredient14: ingredient14, ingredient15: ingredient15, measure1: measure1, measure2: measure2, measure3: measure3, measure4: measure4, measure5: measure5, measure6: measure6, measure7: measure7, measure8: measure8, measure9: measure9, measure10: measure10, measure11: measure11, measure12: measure12, measure13: measure13, measure14: measure14, measure15: measure15)
    }
}
