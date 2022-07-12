//
//  RecipesInfosListViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 09/07/2022.
//

import UIKit

class RecipesInfosListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var recipesListView: UITableView!
    var mealRecipeService : MealRecipeService = MealRecipeWebService()
    
    var recipes: [MealInfos] = [] {
        didSet {
            self.recipesListView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "RecipeInfoTableViewCell", bundle: nil)
        self.recipesListView.register(nib, forCellReuseIdentifier: "RECIPE_INFO_CELL_ID")
        self.recipesListView.delegate = self
        self.recipesListView.dataSource = self
        self.mealRecipeService.fetchRecipesByCategory { categories in
            self.recipes = categories
        }

    }

    @objc func handleEditTableView() {
        UIView.animate(withDuration: 0.66) {
            self.recipesListView.isEditing = !self.recipesListView.isEditing
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = self.recipes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RECIPE_INFO_CELL_ID", for: indexPath) as! RecipeInfoTableViewCell
        cell.setRecipeInfo(with: recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let src = self.recipes.remove(at: sourceIndexPath.row)
        self.recipes.insert(src, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = self.recipes[indexPath.row]
        self.navigationController?.pushViewController(Lo(), animated: true)
        print(recipe.strMeal)
    }
    
}
