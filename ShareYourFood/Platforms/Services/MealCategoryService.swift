//
//  MealCategoryService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 23/06/2022.
//

import Foundation

protocol MealCategoryService {
    func fetchCategories(completion: @escaping ([MealCategory]) -> Void) -> Void;
}
