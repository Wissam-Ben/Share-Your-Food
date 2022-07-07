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
    
    func setCategory(with category: MealCategory) {
        var imageCategory = setImageAnime(animeImageString: category.thumb)
        self.categoryImage.image = imageCategory
        self.categoryName.text = category.name
        //self.categoryDescription.text = category.description
        //self.categoryDescription.numberOfLines = 0
        //print(category.description)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setImageAnime(animeImageString: String) -> UIImage{
            let url = URL(string: animeImageString)
            let data = try? Data(contentsOf: url!)

            let animeImage: UIImage

            if let imageData = data {
                animeImage = UIImage(data: imageData)!
            } else {
                let imageName = "not_found"
                let image = UIImage(named: imageName)
                animeImage = image!
            }

            return animeImage
        }
    
}
