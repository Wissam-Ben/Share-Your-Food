//
//  UserSave.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import Foundation


// to delete


class UserAccount: Codable {
    
    var id: Int
    var firstname: String
    var lastname: String
    var username: String
    var password: String
    var email: String
    var photo: String
    var number: String
    var address: String
    
        
    init(id: Int, firstname: String, lastname: String, username: String, password: String, email: String, photo: String, number: String, address: String) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.username = username
        self.password = password
        self.email = email
        self.photo = photo
        self.number = number
        self.address = address
    }
        
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let firstname = dict["firstname"] as? String,
              let lastname = dict["lastname"] as? String,
              let username = dict["username"] as? String,
              let password = dict["password"] as? String,
              let email = dict["email"] as? String,
              let photo = dict["photo"] as? String,
              let number = dict["number"] as? String,
              let address = dict["address"] as? String else {
            return nil
        }
        self.init(id: id, firstname: firstname, lastname: lastname, username: username, password: password, email:email, photo:photo, number:number, address:address)
    }
}
