//
//  Session.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

class Session {
    var id: Int
    var token: String
    var UserId: Int
        
    internal init(id: Int, token: String, UserId: Int) {
        self.id = id
        self.token = token
        self.UserId = UserId
    }
    
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let token = dict["token"] as? String,
              let UserId = dict["UserId"] as? Int else {
            return nil
        }
        self.init(id: id, token: token, UserId: UserId)
    }
    
    
}
