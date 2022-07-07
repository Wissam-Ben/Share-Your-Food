//
//  SearchRecipeListViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 22/06/2022.
//

import UIKit

class SearchRecipeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var recipeTableView: UITableView!
    @IBOutlet var recipesIndicatorView: UIActivityIndicatorView!
    
    var recipes: [MealInfos]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "SearchRecipeTableViewCell", bundle: nil)
        self.recipeTableView.register(cellNib, forCellReuseIdentifier: "RECIPE_INFO_CELL")
        self.recipeTableView.delegate = self
        self.recipeTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    static func newInstance(recipes: [MealInfos]) -> SearchRecipeListViewController {
        let infos = SearchRecipeListViewController()
        infos.recipes = recipes
        return infos
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TODO_CELL", for: indexPath) as! SearchRecipeTableViewCell
        cell.recipeNameLabel.text = self.recipes[indexPath.row].strMeal
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.recipes[indexPath.row])
    }
}
