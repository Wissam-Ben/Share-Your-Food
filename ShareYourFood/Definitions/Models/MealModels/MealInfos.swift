//
//  MealInfos.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/06/2022.
//

import Foundation

class MealInfos {
    
    var idMeal: Int
    var strMeal: String
    var strMealThumb: String
    
    init(idMeal: Int, strMeal: String, strMealThumb: String) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
    }
    
    convenience init?(dict: [String: Any]) {
        guard let meal = dict["meals"] as? [String: Any],
              let idMeal = meal["idMeal"] as? Int,
              let strMeal = meal["strMeal"] as? String,
              let strMealThumb = meal["strMealThumb"] as? String else {
            return nil
        }
        self.init(idMeal: idMeal, strMeal: strMeal, strMealThumb: strMealThumb)
    }
}
