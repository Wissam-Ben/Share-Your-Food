//
//  PlateByIdResponse.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 17/07/2022.
//

import Foundation

class PlateByIdResponse {
    var id: Int
    var name: String
    var photo: PhotoResponse
    var quantity: Int
    var number: Int
    var comment: String
    var reserved: Int
    var userId: Int
    var createdAt: String
    
    
    init(id: Int, name: String, photo: PhotoResponse, quantity: Int, number: Int, comment: String, reserved: Int, userId: Int, createdAt: String) {
        self.id = id
        self.name = name
        self.photo = photo
        self.quantity = quantity
        self.number = number
        self.comment = comment
        self.reserved = reserved
        self.userId = userId
        self.createdAt = createdAt
    }
    
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let name = dict["name"] as? String,
              let photo = dict["photo"] as? [String: Any],
              let quantity = dict["quantity"] as? Int,
              let number = dict["number"] as? Int,
              let comment = dict["comment"] as? String,
              let reserved = dict["reserved"] as? Int,
              let userId = dict["UserId"] as? Int,
              let createdAt = dict["createdAt"] as? String,
              let photoResponseObject = PhotoResponse(dict: photo) else {
            return nil
        }
        self.init(id:id, name: name, photo: photoResponseObject, quantity: quantity, number: number, comment: comment, reserved: reserved, userId: userId, createdAt: createdAt)
    }
    
}
