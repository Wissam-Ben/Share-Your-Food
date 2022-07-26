//
//  MealRecipeService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 26/06/2022.
//

import Foundation

protocol MealRecipeService {
    func fetchRecipesByCategory(completion: @escaping ([MealInfos]) -> Void, category: String) -> Void;
    func fetchRecipeDetailsById(completion: @escaping ([MealRecipe]) -> Void, id: String) -> Void;
}
