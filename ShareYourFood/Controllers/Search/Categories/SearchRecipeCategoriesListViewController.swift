//
//  SearchRecipeCategoriesListViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 23/06/2022.
//

import UIKit

class SearchRecipeCategoriesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var categoriesIndicatorView: UIActivityIndicatorView!
    var mealCategoryService : MealCategoryService = MealCategoryWebService()
    
    var categories: [MealCategory] = [] {
        didSet {
            self.categoryTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("search.categories.title", comment: "")
        
        let nib = UINib(nibName: "SearchRecipeCategoriesTableViewCell", bundle: nil)
        self.categoryTableView.register(nib, forCellReuseIdentifier: "CATEGORY_CELL_ID")
        self.categoryTableView.delegate = self
        self.categoryTableView.dataSource = self
        self.mealCategoryService.fetchCategories { categories in
            self.categoriesIndicatorView.stopAnimating()
            self.categories = categories
        }
    }
    
    @objc func handleEditTableView() {
        UIView.animate(withDuration: 0.66) {
            self.categoryTableView.isEditing = !self.categoryTableView.isEditing
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = self.categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CATEGORY_CELL_ID", for: indexPath) as! SearchRecipeCategoriesTableViewCell
        cell.setCategory(with: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let src = self.categories.remove(at: sourceIndexPath.row)
        self.categories.insert(src, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recipes = RecipesInfosListViewController()
        
        let category = self.categories[indexPath.row]
    
        recipes.configure(with: category)
        
        self.navigationController?.pushViewController(recipes, animated: true)
        
        print(category.name)
    }
    
    
    
}
