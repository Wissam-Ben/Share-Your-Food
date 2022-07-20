//
//  User.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

class UserSubscribe: Codable {
    
    var firstname: String
    var lastname: String
    var username: String
    var password: String
    var email: String
    
    init(firstname: String, lastname: String, username: String, password: String, email: String) {
        
        self.firstname = firstname
        self.lastname = lastname
        self.username = username
        self.password = password
        self.email = email

    }
    
    convenience init?(dict: [String: Any]) {
        guard let firstname = dict["firstname"] as? String,
              let lastname = dict["lastname"] as? String,
              let username = dict["username"] as? String,
              let password = dict["password"] as? String,
              let email = dict["email"] as? String else {
            return nil
        }
        self.init(firstname: firstname, lastname: lastname, username: username, password: password, email:email)
    }
    
    func toJSON() -> [String: Any] {
        return [
            "firstname": self.firstname,
            "lastname": self.lastname,
            "username": self.username,
            "password": self.password,
            "email": self.email
            
        ]
    }
}

