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
    @IBOutlet weak var emailLabel: UILabel!
    
    var userId: Int!
    
    var user: User!
    var users: [User]!
    
    var userService: UserService = UserWebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("account.title", comment: "")
        
        self.userId = 6
        
        self.userService.fetchUsers { users in
            self.users = users
            
            for user in users {
                if (self.userId == user.id) {
                    self.username.text = user.username
                    self.firstname.text = user.firstname
                    self.lastname.text = user.lastname
                    self.email.text = user.email
                }
            }
        }

    }

}
