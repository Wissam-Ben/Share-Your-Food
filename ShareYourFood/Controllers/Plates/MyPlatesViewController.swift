//
//  MyPlatesViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import UIKit

class MyPlatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var platesList: UITableView!
    @IBOutlet weak var handleItemTapped: UITabBarItem!
    
    @IBOutlet weak var myPlatesTitle: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var plateService: PlateService = PlateWebService()
    
    var plates: [PlateResponse] = [] {
        didSet {
            self.platesList.reloadData()
        }
    }
    
    let myRefreshControl: UIRefreshControl = {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
            return refreshControl
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ""
        
        self.myPlatesTitle.text = NSLocalizedString("my.plates.title", comment: "")

        let nib = UINib(nibName: "plateTableViewCell", bundle: nil)
        self.platesList.register(nib, forCellReuseIdentifier: "PLATE_CELL_ID")
        self.platesList.delegate = self
        self.platesList.dataSource = self
        self.plateService.fetchPlates { plates in
            self.activityIndicator.stopAnimating()
            for plate in plates {
                if plate.user.id == UserDefaults.standard.integer(forKey: MyVariables.id) {
                    self.activityIndicator.stopAnimating()
                    self.plates.append(plate)
                }
            }
            
        }
        self.platesList.refreshControl = myRefreshControl
        
    }
    
    @objc private func refresh(sender: UIRefreshControl){
        plates.removeAll()

        self.plateService.fetchPlates { plates in
            for plate in plates {
                if plate.user.id == UserDefaults.standard.integer(forKey: MyVariables.id) {
                    self.plates.append(plate)
                }
            }
            
        }
        sender.endRefreshing()
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
    
        platedetails.configure(with: plate)
        
        self.navigationController?.pushViewController(platedetails, animated: true)
    
    }

    
}
