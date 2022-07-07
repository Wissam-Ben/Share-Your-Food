//
//  MealCategoryWebService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 23/06/2022.
//

import Foundation

class MealCategoryWebService : MealCategoryService {
    func fetchCategories(completion: @escaping ([MealCategory]) -> Void) -> Void {
        print("Helllllooooo créer URL")
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {
            completion([])
            print("Helllllooooo impossible de créer URL")// impossible de créer l'url
            return
        }
                
        let dataTask = URLSession.shared.dataTask(with: url) { data, res, err in
            guard let fetchData = data,
                  let json = try? JSONSerialization.jsonObject(with: fetchData) as? [String: Any],
                  let categories = json["categories"] as? [ [String: Any] ] else {
                DispatchQueue.main.async {
                    print("completion");
                    completion([]) // écoute le résultat
                }
                return
            }
            //print(json)
            let categoryObjects: [MealCategory] = categories.compactMap{ obj in
                //print(obj)
                return MealCategory(dict: obj)
            }
            //print(categoryObjects)
            DispatchQueue.main.async {
                completion(categoryObjects) // écoute le résultat
            }
        }
        dataTask.resume()
    }
}
