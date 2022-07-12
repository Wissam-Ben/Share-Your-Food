//
//  RecipeDetailsMealViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 09/07/2022.
//

import UIKit

class RecipeDetailsMealViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeNameTextField: UILabel!
    @IBOutlet weak var recipeIngredientsTableView: UITableView!
    @IBOutlet weak var recipeInstructionsTextField: UILabel!
    
    var mealRecipeService : MealRecipeService = MealRecipeWebService()
    
    var recipes: [MealRecipe] = [] {
        didSet {
            self.recipesListView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
