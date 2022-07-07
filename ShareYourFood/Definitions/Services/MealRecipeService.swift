//
//  MealRecipeService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 26/06/2022.
//

import Foundation

protocol MealRecipeService {
    func fetchRecipes(completion: @escaping ([MealInfos]) -> Void) -> Void;
}
