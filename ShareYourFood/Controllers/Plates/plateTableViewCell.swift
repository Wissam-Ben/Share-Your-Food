//
//  plateTableViewCell.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import UIKit

class plateTableViewCell: UITableViewCell {

    @IBOutlet weak var plateImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var plateName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPlate(with plate: PlateResponse) {
        var imagePlate = setPlateImage(plateImageString: plate.photo)
        self.plateImage.image = imagePlate
        self.username.text = plate.user.username
        self.plateName.text = plate.name
    }
    
    private func setPlateImage(plateImageString: String) -> UIImage{
        let url = URL(string: plateImageString)
        let data = try? Data(contentsOf: url!)

        let plateImage: UIImage

        if let imageData = data {
            plateImage = UIImage(data: imageData)!
        } else {
            let imageName = "not_found"
            let image = UIImage(named: imageName)
            plateImage = image!
        }
        
        return plateImage
    }
    
}
