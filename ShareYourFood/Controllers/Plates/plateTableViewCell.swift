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
    
}
