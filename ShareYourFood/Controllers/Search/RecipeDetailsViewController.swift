//
//  RecipeDetailsViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 09/07/2022.
//

import UIKit

class RecipeDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
