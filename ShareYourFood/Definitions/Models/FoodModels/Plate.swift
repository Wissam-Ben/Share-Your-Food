//
//  Plate.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

class Plate {
    var id: Int
    var name: String
    var photo: String
    var quantity: Int
    var number: Int
    var comment: String
    var reserved: Bool
    var user: User
    var createdAt: String
    
    
    internal init(id: Int, name: String, photo: String, quantity: Int, number: Int, comment: String, reserved: Bool, user: User, createdAt: String) {
        self.id = id
        self.name = name
        self.photo = photo
        self.quantity = quantity
        self.number = number
        self.comment = comment
        self.reserved = reserved
        self.user = user
        self.createdAt = createdAt
    }
    
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let name = dict["name"] as? String,
              let photo = dict["photo"] as? String,
              let quantity = dict["quantity"] as? Int,
              let number = dict["number"] as? Int,
              let comment = dict["comment"] as? String,
              let reserved = dict["reserved"] as? Bool,
              let user = dict["UserId"] as? User,
              let createdAt = dict["createdAt"] as? String else {
            return nil
        }
        self.init(id: id, name: name, photo: photo, quantity: quantity, number: number, comment: comment, reserved: reserved, user: user, createdAt: createdAt)
    }
    
}
