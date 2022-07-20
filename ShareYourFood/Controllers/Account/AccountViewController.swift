//
//  AccountViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var userId: String!
    
    var user: User!
    
    var userService: UserService = UserWebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userService.fetchUserById(userId: "5") { user in
            self.user = user
            self.username.text = self.user.username
            self.firstname.text = self.user.firstname
            self.lastname.text = self.user.lastname
            self.email.text = self.user.email
        }

    }

}
