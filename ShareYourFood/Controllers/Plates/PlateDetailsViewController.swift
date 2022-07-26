//
//  PlateDetailsViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import UIKit
import SwiftUI

class PlateDetailsViewController: UIViewController {

    @IBOutlet weak var plateImage: UIImageView!
    @IBOutlet weak var plateName: UILabel!
    @IBOutlet weak var portionLabel: UILabel!
    @IBOutlet weak var portion: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var reserveOrDeleteButton: UIButton!
    @IBOutlet weak var createdBy: UILabel!
    @IBOutlet weak var username: UILabel!
    
    var plate: PlateResponse!
    
    var plateService: PlateService {
            return PlateWebService()
    }
    
    var reservationService: ReservationService {
            return ReservationWebService()
    }
    
    let myRefreshControl: UIRefreshControl = {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
            return refreshControl
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("plate.details.title", comment: "")
        
        self.portionLabel.text = NSLocalizedString("plate.portion.title", comment: "")
        self.quantityLabel.text = NSLocalizedString("plate.quantity.title", comment: "")
        self.createdAt.text = NSLocalizedString("plate.createdAt.title", comment: "")
        self.commentLabel.text = NSLocalizedString("plate.comment.title", comment: "")
        self.createdBy.text = NSLocalizedString("plate.username.title", comment: "")
        // verifier les id utilisateur
        if(self.plate.user.id == UserDefaults.standard.integer(forKey: MyVariables.id)) {
            self.reserveOrDeleteButton.setTitle(NSLocalizedString("plate.delete.button", comment: ""), for: UIControl.State.normal)
        } else {
            self.reserveOrDeleteButton.setTitle(NSLocalizedString("plate.reserve.button", comment: ""), for: UIControl.State.normal)
        }
        self.plateImage.image = setPlateImage(plateImageString: self.plate.photo)
        self.username.text = self.plate.user.username
        self.plateName.text = self.plate.name
        self.portion.text = self.plate.quantity.description
        self.quantity.text = self.plate.number.description
        self.date.text = self.plate.createdAt
        self.comment.text = self.plate.comment

    }
    
    @objc private func refresh(sender: UIRefreshControl){
      
        self.title = NSLocalizedString("plate.details.title", comment: "")
        
        self.portionLabel.text = NSLocalizedString("plate.portion.title", comment: "")
        self.quantityLabel.text = NSLocalizedString("plate.quantity.title", comment: "")
        self.createdAt.text = NSLocalizedString("plate.portion.title", comment: "")
        self.commentLabel.text = NSLocalizedString("plate.comment.title", comment: "")
        self.createdBy.text = NSLocalizedString("plate.username.title", comment: "")
        
        self.quantity.text = self.plate.number.description
        if self.plate.number.description == "0" {
            self.reserveOrDeleteButton.isEnabled = false
        } else {
            if(self.plate.user.id == UserDefaults.standard.integer(forKey: MyVariables.id)) {
                self.reserveOrDeleteButton.setTitle(NSLocalizedString("plate.delete.button", comment: ""), for: UIControl.State.normal)
            } else {
                self.reserveOrDeleteButton.setTitle(NSLocalizedString("plate.reserve.button", comment: ""), for: UIControl.State.normal)
            }
        }
        
        self.plateImage.image = setPlateImage(plateImageString: self.plate.photo)
        self.username.text = self.plate.user.username
        self.plateName.text = self.plate.name
        self.portion.text = self.plate.quantity.description
        self.quantity.text = self.plate.number.description
        self.date.text = self.plate.createdAt
        self.comment.text = self.plate.comment
        sender.endRefreshing()
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
    
    func configure(with plate: PlateResponse) {
        self.plate = plate
    }
    
    @IBAction func handleReserveOrDeleteButton(_ sender: Any) {
        if(self.plate.user.id == UserDefaults.standard.integer(forKey: MyVariables.id) ) {
            self.plateService.deletePlate(plateId: self.plate.id) { _ in
            }
        } else {
            self.reservationService.addReservation(reservation: ReservationRequest(plateId: self.plate.id)) { _ in
            }
        }
    }
    
    
}
