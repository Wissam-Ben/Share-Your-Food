//
//  PlateDetailsViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import UIKit

class PlateDetailsViewController: UIViewController {

    @IBOutlet weak var plateImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var plateName: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var reserved: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
