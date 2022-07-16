//
//  UserSubscribeResponse.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/07/2022.
//

import Foundation

class UserSubscribeResponse {
    
    var id: Int
    var firstname: String
    var lastname: String
    var username: String
    var password: String
    var email: String
    var role: Int
    var createdAt: String
    
    init(id: Int, firstname: String, lastname: String, username: String, password: String, email: String, role: Int, createdAt: String) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.username = username
        self.password = password
        self.email = email
        self.role = role
        self.createdAt = createdAt
    }
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let firstname = dict["firstname"] as? String,
              let lastname = dict["lastname"] as? String,
              let username = dict["username"] as? String,
              let password = dict["password"] as? String,
              let email = dict["email"] as? String,
              let role = dict["role"] as? Int,
              let createdAt = dict["createdAt"] as? String else {
            return nil
        }
        self.init(id: id, firstname: firstname, lastname: lastname, username: username, password: password, email:email, role:role, createdAt: createdAt)
    }
    
    func toJSON() -> [String: Any] {
        return [
            "id": self.id
            "firstname": self.firstname
            "lastname": self.lastname
            "username": self.username
            "password": self.password
            "email": self.email
            "role": self.role
            "createdAt": self.createdAt
        ]
    }
}

