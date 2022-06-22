//
//  MealRecipe.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/06/2022.
//

import Foundation

class MealRecipe {
    
    init(id: String, name: String, category: String, area: String, instructions: String, thumb: URL, ingredient1: String, ingredient2: String, ingredient3: String, ingredient4: String, ingredient5: String, ingredient6: String, ingredient7: String, ingredient8: String, ingredient9: String, ingredient10: String, ingredient11: String, ingredient12: String, ingredient13: String, ingredient14: String, ingredient15: String, ingredient16: String, ingredient17: String, ingredient18: String, ingredient19: String, ingredient20: String, measure1: String, measure2: String, measure3: String, measure4: String, measure5: String, measure6: String, measure7: String, measure8: String, measure9: String, measure10: String, measure11: String, measure12: String, measure13: String, measure14: String, measure15: String, measure16: String, measure17: String, measure18: String, measure19: String, measure20: String) {
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
        self.ingredient16 = ingredient16
        self.ingredient17 = ingredient17
        self.ingredient18 = ingredient18
        self.ingredient19 = ingredient19
        self.ingredient20 = ingredient20
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
        self.measure16 = measure16
        self.measure17 = measure17
        self.measure18 = measure18
        self.measure19 = measure19
        self.measure20 = measure20
    }
    
    var id: String
    var name: String
    var category: String
    var area: String
    var instructions: String
    var thumb: URL
    //var youtube: URL
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
    var ingredient16: String
    var ingredient17: String
    var ingredient18: String
    var ingredient19: String
    var ingredient20: String
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
    var measure16: String
    var measure17: String
    var measure18: String
    var measure19: String
    var measure20: String
    
    convenience init?(dict: [String: Any]) {
        guard let meal = dict["meals"] as? [String: Any],
              let id = meal["idMeal"] as? String,
              let name = meal["strMeal"] as? String,
              let category = meal["strCategory"] as? String,
              let area = meal["strArea"] as? String,
              let instructions = meal["strInstructions"] as? String,
              let thumb = meal["strMealThumb"] as? URL,
              let ingredient1 = meal["strIngredient1"] as? String,
              let ingredient2 = meal["strIngredient2"] as? String,
              let ingredient3 = meal["strIngredient3"] as? String,
              let ingredient4 = meal["strIngredient4"] as? String,
              let ingredient5 = meal["strIngredient5"] as? String,
              let ingredient6 = meal["strIngredient6"] as? String,
              let ingredient7 = meal["strIngredient7"] as? String,
              let ingredient8 = meal["strIngredient8"] as? String,
              let ingredient9 = meal["strIngredient9"] as? String,
              let ingredient10 = meal["strIngredient10"] as? String,
              let ingredient11 = meal["strIngredient11"] as? String,
              let ingredient12 = meal["strIngredient12"] as? String,
              let ingredient13 = meal["strIngredient13"] as? String,
              let ingredient14 = meal["strIngredient14"] as? String,
              let ingredient15 = meal["strIngredient15"] as? String,
              let ingredient16 = meal["strIngredient16"] as? String,
              let ingredient17 = meal["strIngredient17"] as? String,
              let ingredient18 = meal["strIngredient18"] as? String,
              let ingredient19 = meal["strIngredient19"] as? String,
              let ingredient20 = meal["strIngredient20"] as? String,
              let measure1 = meal["strMeasure1"] as? String,
              let measure2 = meal["strMeasure2"] as? String,
              let measure3 = meal["strMeasure3"] as? String,
              let measure4 = meal["strMeasure4"] as? String,
              let measure5 = meal["strMeasure5"] as? String,
              let measure6 = meal["strMeasure6"] as? String,
              let measure7 = meal["strMeasure7"] as? String,
              let measure8 = meal["strMeasure8"] as? String,
              let measure9 = meal["strMeasure9"] as? String,
              let measure10 = meal["strMeasure10"] as? String,
              let measure11 = meal["strMeasure11"] as? String,
              let measure12 = meal["strMeasure12"] as? String,
              let measure13 = meal["strMeasure13"] as? String,
              let measure14 = meal["strMeasure14"] as? String,
              let measure15 = meal["strMeasure15"] as? String,
              let measure16 = meal["strMeasure16"] as? String,
              let measure17 = meal["strMeasure17"] as? String,
              let measure18 = meal["strMeasure18"] as? String,
              let measure19 = meal["strMeasure19"] as? String,
              let measure20 = meal["strMeasure20"] as? String else {
            return nil
        }
        self.init(id: id, name: name, category: category, area: area, instructions: instructions, thumb: thumb, ingredient1: ingredient1, ingredient2: ingredient2, ingredient3: ingredient3, ingredient4: ingredient4, ingredient5: ingredient5, ingredient6: ingredient6, ingredient7: ingredient7, ingredient8: ingredient8, ingredient9: ingredient9, ingredient10: ingredient10, ingredient11: ingredient11, ingredient12: ingredient12, ingredient13: ingredient13, ingredient14: ingredient14, ingredient15: ingredient15, ingredient16: ingredient16, ingredient17: ingredient17, ingredient18: ingredient18, ingredient19: ingredient19, ingredient20: ingredient20, measure1: measure1, measure2: measure2, measure3: measure3, measure4: measure4, measure5: measure5, measure6: measure6, measure7: measure7, measure8: measure8, measure9: measure9, measure10: measure10, measure11: measure11, measure12: measure12, measure13: measure13, measure14: measure14, measure15: measure15, measure16: measure16, measure17: measure17, measure18: measure18, measure19: measure19, measure20: measure20)
    }
}
