//
//  PlateResponse.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 20/07/2022.
//

import Foundation

class PlateResponse {
    var id: Int
    var name: String
    var photo: String
    var quantity: Int
    var number: Int
    var comment: String
    var reserved: Bool
    var user: UserPlate
    var createdAt: String
    var description: String {
        return "id: \(self.id), name: \(self.name), photo: photo, portion: \(self.quantity), quantity: \(self.number), comment: \(self.comment), reserved: \(self.reserved), user: \(self.user.username), date: \(self.createdAt) "
        //return "id: \(self.id), name: \(self.name), photo: photo, portion: \(self.quantity), quantity: \(self.number), comment: \(self.comment), reserved: \(self.reserved), user: \(self.user.username), date: \(self.createdAt) "
        }
    
    
    init(id: Int, name:String, photo: String, quantity: Int, number: Int, comment: String, reserved: Bool, user: UserPlate, createdAt: String
     ) {
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
              let user = dict["User"] as? [String: Any],
              let createdAt = dict["createdAt"] as? String,
              let userPlateObject = UserPlate(dict: user)
        else {
            print("erreur")
            return nil
        }
        
        self.init(id: id, name: name, photo: photo, quantity: quantity, number: number, comment: comment, reserved: reserved, user: userPlateObject, createdAt: createdAt)
        
        
        //let photoResponseObjectNull = PhotoResponse(type: "", data: [])
        //let photoResponseObject = PhotoResponse(dict: photo)
        //self.init(id: id, name: name, photo: photoResponseObject, quantity: quantity, number: number, comment: comment, reserved: reserved, user: userPlateObject, createdAt: createdAt)
    }
    
}
