//
//  Plate.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

class PlateRequest : Codable {
    var name: String
    var photo: String
    var quantity: Int
    var number: Int
    var comment: String
    var reserved: Bool
    var userId: Int
    
    
    init( name: String, photo: String, quantity: Int, number: Int, comment: String, reserved: Bool, userId: Int) {
        self.name = name
        self.photo = photo
        self.quantity = quantity
        self.number = number
        self.comment = comment
        self.reserved = reserved
        self.userId = userId
    }
    
    
    convenience init?(dict: [String: Any]) {
        guard let name = dict["name"] as? String,
              let photo = dict["photo"] as? String,
              let quantity = dict["quantity"] as? Int,
              let number = dict["number"] as? Int,
              let comment = dict["comment"] as? String,
              let reserved = dict["reserved"] as? Bool,
              let userId = dict["UserId"] as? Int else {
            return nil
        }
        self.init(name: name, photo: photo, quantity: quantity, number: number, comment: comment, reserved: reserved, userId: userId)
    }
    
}
