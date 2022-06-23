//
//  SearchRecipeCategoriesTableViewCell.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 23/06/2022.
//

import UIKit

class SearchRecipeCategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
