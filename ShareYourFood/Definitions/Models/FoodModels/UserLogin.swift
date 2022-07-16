//
//  UseLogin.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/07/2022.
//

import Foundation

class UserLogin: Codable {
    
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    convenience init?(dict: [String: Any]) {
        guard let username = dict["username"] as? String,
              let password = dict["password"] as? String else {
            return nil
        }
        self.init(username: username, password: password)
    }
    
    func toJSON() -> [String: Any] {
        return [
            "username": self.username
            "Password": self.password
        ]
    }
}
