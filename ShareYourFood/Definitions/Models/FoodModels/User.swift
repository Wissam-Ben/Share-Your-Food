//
//  User.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 15/07/2022.
//

import Foundation


class User: Codable {
    
    var id: String
    var firstname: String
    var lastname: String
    var username: String
    var password: String
    var email: String
        
    init(id: String, firstname: String, lastname: String, username: String, password: String, email: String) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.username = username
        self.password = password
        self.email = email
    }
        
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? String,
              let firstname = dict["firstname"] as? String,
              let lastname = dict["lastname"] as? String,
              let username = dict["username"] as? String,
              let password = dict["password"] as? String,
              let email = dict["email"] as? String else {
            return nil
        }
        self.init(id: id, firstname: firstname, lastname: lastname, username: username, password: password, email: email)
    }
}
