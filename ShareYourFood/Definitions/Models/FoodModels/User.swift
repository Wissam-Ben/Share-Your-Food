//
//  User.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 15/07/2022.
//

import Foundation


class User {
    
    var id: Int
    var firstname: String
    var lastname: String
    var username: String
    
    init(id: Int, firstname: String, lastname: String, username: String) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.username = username
    }
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let firstname = dict["firstname"] as? String,
              let lastname = dict["lastname"] as? String,
              let username = dict["username"] as? String else {
            return nil
        }
        self.init(id: id, firstname: firstname, lastname: lastname, username: username)
    }
}
