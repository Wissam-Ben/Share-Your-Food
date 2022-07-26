//
//  MealInfos.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/06/2022.
//

import Foundation

class MealInfos {
    
    var idMeal: String
    var strMeal: String
    var strMealThumb: String
    
    init(idMeal: String, strMeal: String, strMealThumb: String) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
    }
    
    convenience init?(dict: [String: Any]) {
        guard let idMeal = dict["idMeal"] as? String,
              let strMeal = dict["strMeal"] as? String,
              let strMealThumb = dict["strMealThumb"] as? String else {
            return nil
        }
        self.init(idMeal: idMeal, strMeal: strMeal, strMealThumb: strMealThumb)
    }
}
