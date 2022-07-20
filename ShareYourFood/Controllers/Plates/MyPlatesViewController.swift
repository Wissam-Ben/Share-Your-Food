//
//  MyPlatesViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import UIKit

class MyPlatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var platesList: UITableView!
    
    var plates: [Plate] = [] {
        didSet {
            self.platesList.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "plateTableViewCell", bundle: nil)
        self.platesList.register(nib, forCellReuseIdentifier: "PLATE_CELL_ID")
        self.platesList.delegate = self
        self.platesList.dataSource = self
        
    }
    
    @objc func handleEditTableView() {
        UIView.animate(withDuration: 0.66) {
            self.platesList.isEditing = !self.platesList.isEditing
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let plate = self.plates[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PLATE_CELL_ID", for: indexPath) as! plateTableViewCell
        cell.setPlate(with: plate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let src = self.plates.remove(at: sourceIndexPath.row)
        self.plates.insert(src, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let platedetails = PlateDetailsViewController()
        
        let plate = self.plates[indexPath.row]
    
        // add configure to plate details
        
        self.navigationController?.pushViewController(platedetails, animated: true)
    
    }
    

}
