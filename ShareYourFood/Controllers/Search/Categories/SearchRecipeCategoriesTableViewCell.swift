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
    }
    
    func setCategory(with category: MealCategory) {
        var imageCategory = setImageCategory(categoryImageString: category.thumb)
        self.categoryImage.image = imageCategory
        self.categoryName.text = category.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func setImageCategory(categoryImageString: String) -> UIImage{
        let url = URL(string: categoryImageString)
        let data = try? Data(contentsOf: url!)

        let categoryImage: UIImage

        if let imageData = data {
            categoryImage = UIImage(data: imageData)!
        } else {
            let imageName = "default_image"
            guard let image = UIImage(named: imageName) else {
                return UIImage(named: "default_image")!
            }
            categoryImage = image
        }
        
        return categoryImage
    }
    
    
}
