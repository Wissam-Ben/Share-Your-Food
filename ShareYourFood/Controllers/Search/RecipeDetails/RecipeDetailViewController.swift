//
//  RecipeDetailViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 18/07/2022.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    var recipeId: String!
    
    var recipe: MealRecipe!
    
    var mealRecipeService: MealRecipeService = MealRecipeWebService()
    
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameTextView: UILabel!
    @IBOutlet weak var areaTextView: UILabel!
    @IBOutlet weak var instructionsTextView: UILabel!
    
    @IBOutlet weak var measure1TextView: UILabel!
    @IBOutlet weak var measure2TextView: UILabel!
    @IBOutlet weak var measure3TextView: UILabel!
    @IBOutlet weak var measure4TextView: UILabel!
    @IBOutlet weak var measure5TextView: UILabel!
    @IBOutlet weak var measure6TextView: UILabel!
    @IBOutlet weak var measure7TextView: UILabel!
    @IBOutlet weak var measure8TextView: UILabel!
    @IBOutlet weak var measure9TextView: UILabel!
    @IBOutlet weak var measure10TextView: UILabel!
    @IBOutlet weak var measure11TextView: UILabel!
    @IBOutlet weak var measure12TextView: UILabel!
    @IBOutlet weak var measure13TextView: UILabel!
    @IBOutlet weak var measure14TextView: UILabel!
    @IBOutlet weak var measure15TextView: UILabel!
    
    @IBOutlet weak var ingredient1TextView: UILabel!
    @IBOutlet weak var ingredient2TextView: UILabel!
    @IBOutlet weak var ingredient3TextView: UILabel!
    @IBOutlet weak var ingredient4TextView: UILabel!
    @IBOutlet weak var ingredient5TextView: UILabel!
    @IBOutlet weak var ingredient6TextView: UILabel!
    @IBOutlet weak var ingredient7TextView: UILabel!
    @IBOutlet weak var ingredient8TextView: UILabel!
    @IBOutlet weak var ingredient9TextView: UILabel!
    @IBOutlet weak var ingredient10TextView: UILabel!
    @IBOutlet weak var ingredient11TextView: UILabel!
    @IBOutlet weak var ingredient12TextView: UILabel!
    @IBOutlet weak var ingredient13TextView: UILabel!
    @IBOutlet weak var ingredient14TextView: UILabel!
    @IBOutlet weak var ingredient15TextView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("recipe.details.title", comment: "")
        
        self.mealRecipeService.fetchRecipeDetailsById(completion: { recipes in
            print(recipes)
            self.recipe = recipes.first
            
            let image = self.setImageRecipe(recipeImageString: self.recipe.thumb)
            
            self.recipeImageView.image = image
            
            self.recipeNameTextView.text = self.recipe.name
            self.areaTextView.text = self.recipe.area
            self.instructionsTextView.text = self.recipe.instructions
            self.measure1TextView.text = self.recipe.measure1
            self.measure2TextView.text = self.recipe.measure2
            self.measure3TextView.text = self.recipe.measure3
            self.measure4TextView.text = self.recipe.measure4
            self.measure5TextView.text = self.recipe.measure5
            self.measure6TextView.text = self.recipe.measure6
            self.measure7TextView.text = self.recipe.measure7
            self.measure8TextView.text = self.recipe.measure8
            self.measure9TextView.text = self.recipe.measure9
            self.measure10TextView.text = self.recipe.measure10
            self.measure11TextView.text = self.recipe.measure11
            self.measure12TextView.text = self.recipe.measure12
            self.measure13TextView.text = self.recipe.measure13
            self.measure14TextView.text = self.recipe.measure14
            self.measure15TextView.text = self.recipe.measure15

            self.ingredient1TextView.text = self.recipe.ingredient1
            self.ingredient2TextView.text = self.recipe.ingredient2
            self.ingredient3TextView.text = self.recipe.ingredient3
            self.ingredient4TextView.text = self.recipe.ingredient4
            self.ingredient5TextView.text = self.recipe.ingredient5
            self.ingredient6TextView.text = self.recipe.ingredient6
            self.ingredient7TextView.text = self.recipe.ingredient7
            self.ingredient8TextView.text = self.recipe.ingredient8
            self.ingredient9TextView.text = self.recipe.ingredient9
            self.ingredient10TextView.text = self.recipe.ingredient10
            self.ingredient11TextView.text = self.recipe.ingredient11
            self.ingredient12TextView.text = self.recipe.ingredient12
            self.ingredient13TextView.text = self.recipe.ingredient13
            self.ingredient14TextView.text = self.recipe.ingredient14
            self.ingredient15TextView.text = self.recipe.ingredient15
            
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
            guard let image = UIImage(named: imageName) else {
                return UIImage(named: "default_image")!
            }
            recipeImage = image
        }
        return recipeImage
    }
    
    func configure(with recipe: MealInfos) {
        self.recipeId = recipe.idMeal
        
    }
    
}
