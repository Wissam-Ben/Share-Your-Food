//
//  SearchRecipeCategoriesListViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 23/06/2022.
//

import UIKit

class SearchRecipeCategoriesListViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var categoriesIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "SearchRecipeCategoriesTableViewController", bundle: <#T##Bundle?#>)
    }


}
