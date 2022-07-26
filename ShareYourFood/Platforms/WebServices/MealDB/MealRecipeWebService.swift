//
//  MealRecipeWebService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 01/07/2022.
//

import Foundation

class MealRecipeWebService : MealRecipeService {
    
    func fetchRecipesByCategory(completion: @escaping ([MealInfos]) -> Void, category: String) {
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + category) else {
            completion([])
            print("Impossible de créer URL")
            return
        }
                
        let dataTask = URLSession.shared.dataTask(with: url) { data, res, err in
            guard let fetchData = data,
                  let json = try? JSONSerialization.jsonObject(with: fetchData) as? [String: Any],
                  let recipes = json["meals"] as? [ [String: Any] ] else {
                DispatchQueue.main.async {
                    print("completion");
                    completion([])
                }
                return
            }
            let recipeInfosObjects: [MealInfos] = recipes.compactMap{ obj in
                return MealInfos(dict: obj)
            }
            DispatchQueue.main.async {
                completion(recipeInfosObjects) // écoute le résultat
            }
        }
        dataTask.resume()
    }
    
    func fetchRecipeDetailsById(completion: @escaping ([MealRecipe]) -> Void, id: String) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + id) else {
            completion([])
            print("Impossible de créer URL")
            return
        }
        
        print(url)
                
        let dataTask = URLSession.shared.dataTask(with: url) { data, res, err in
            guard err == nil,
                  let fetchData = data,
                  let json = try? JSONSerialization.jsonObject(with: fetchData) as? [String: Any],
                  let details = json["meals"] as? [ [String: Any] ] else {
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }
            print(json)
            let recipe: [MealRecipe] = details.compactMap{ obj in
                return MealRecipe(dict: obj)
            }
            DispatchQueue.main.async {
                completion(recipe)
            }
        }
        dataTask.resume()
    }
}
