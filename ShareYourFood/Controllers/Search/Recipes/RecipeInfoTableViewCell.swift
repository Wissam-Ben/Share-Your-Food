//
//  RecipeInfoTableViewCell.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 09/07/2022.
//

import UIKit

class RecipeInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setRecipeInfo(with recipe: MealInfos) {
        var imageRecipe = setImageRecipe(recipeImageString: recipe.strMealThumb)
        self.recipeImage.image = imageRecipe
        self.recipeName.text = recipe.strMeal
        self.recipeName.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
}
