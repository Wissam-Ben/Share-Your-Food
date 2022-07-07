//
//  MealRecipeWebService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 01/07/2022.
//

import Foundation

class MealRecipeWebService : MealRecipeService {
    func fetchRecipes(completion: @escaping ([MealInfos]) -> Void) {
        
        print("créer URL")
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {
            completion([])
            print("Helllllooooo impossibke de créer URL")// impossible de créer l'url
            return
        }
                
        let dataTask = URLSession.shared.dataTask(with: url) { data, res, err in
            guard let fetchData = data,
                  let json = try? JSONSerialization.jsonObject(with: fetchData) as? [String: Any],
                  let recipes = json["meals"] as? [ [String: Any] ] else {
                DispatchQueue.main.async {
                    print("completion");
                    completion([]) // écoute le résultat
                }
                return
            }
            print(json)
            let recipeInfosObjects: [MealInfos] = recipes.compactMap{ obj in
                return MealInfos(dict: obj)
            }
            print(recipeInfosObjects)
            DispatchQueue.main.async {
                completion(recipeInfosObjects) // écoute le résultat
            }
        }
        dataTask.resume()
    }
}
