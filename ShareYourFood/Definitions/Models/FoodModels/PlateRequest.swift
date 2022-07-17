//
//  Plate.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

class PlateRequest {
    var id: Int
    var name: String
    var photo: String
    var quantity: Int
    var number: Int
    var comment: String
    var reserved: Bool
    var userId: Int
    
    
    init(id: Int, name: String, photo: String, quantity: Int, number: Int, comment: String, reserved: Bool, userId: Int) {
        self.id = id
        self.name = name
        self.photo = photo
        self.quantity = quantity
        self.number = number
        self.comment = comment
        self.reserved = reserved
        self.userId = userId
    }
    
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let name = dict["name"] as? String,
              let photo = dict["photo"] as? String,
              let quantity = dict["quantity"] as? Int,
              let number = dict["number"] as? Int,
              let comment = dict["comment"] as? String,
              let reserved = dict["reserved"] as? Bool,
              let userId = dict["UserId"] as? Int else {
            return nil
        }
        self.init(id: id, name: name, photo: photo, quantity: quantity, number: number, comment: comment, reserved: reserved, userId: userId)
    }
    
}
