//
//  RecipeDetailsViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 09/07/2022.
//

import UIKit

class RecipeDetailsViewController: UIViewController {

    var recipeId: String!
    
    var recipe: MealRecipe!
    
    var mealRecipeService: MealRecipeService = MealRecipeWebService()
    
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameTextView: UILabel!
    @IBOutlet weak var areaTextViewController: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mealRecipeService.fetchRecipeDetailsById(completion: { recipes in
            print(recipes)
            self.recipe = recipes.first
        }, id: self.recipeId)
    }

    
    private func setImageRecipe(recipeImageString: String) -> UIImage{
        let url = URL(string: recipeImageString)
        let data = try? Data(contentsOf: url!)
        let recipeImage: UIImage
        if let imageData = data {
            recipeImage = UIImage(data: imageData)!
        } else {
            let imageName = "not_found"
            let image = UIImage(named: imageName)
            recipeImage = image!
        }
        return recipeImage
    }
    
    func configure(with recipe: MealInfos) {
        self.recipeId = recipe.idMeal
    }
    
    
}
