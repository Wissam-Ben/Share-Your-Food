//
//  UserSave.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import Foundation

class UserSave: Codable {
    
    var id: Int
    var firstname: String
    var lastname: String
    var username: String
    var password: String
    var email: String
    var photo: String
    var number: String
    var address: String
    var zipcode: String
    var city: String
    var canteat: String
    var bio: String
    var role: Int
    var isAvailable: Int
    var createdAt: String
        
    init(id: Int, firstname: String, lastname: String, username: String, password: String, email: String, photo: String, number: String, address: String, zipcode: String, city: String, canteat: String, bio: String, role: Int, isAvailable: Int, createdAt: String) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.username = username
        self.password = password
        self.email = email
        self.photo = photo
        self.number = number
        self.address = address
        self.zipcode = zipcode
        self.city = city
        self.canteat = canteat
        self.bio = bio
        self.role = role
        self.isAvailable = isAvailable
        self.createdAt = createdAt
    }
        
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let firstname = dict["firstname"] as? String,
              let lastname = dict["lastname"] as? String,
              let username = dict["username"] as? String,
              let password = dict["password"] as? String,
              let email = dict["email"] as? String,
              let photo = dict["photo"] as? String,
              let number = dict["number"] as? String,
              let address = dict["address"] as? String,
              let zipcode = dict["zipcode"] as? String,
              let city = dict["city"] as? String,
              let canteat = dict["canteat"] as? String,
              let bio = dict["bio"] as? String,
              let role = dict["role"] as? Int,
              let isAvailable = dict["isAvailable"] as? Int,
              let createdAt = dict["createdAt"] as? String else {
            return nil
        }
        self.init(id: id, firstname: firstname, lastname: lastname, username: username, password: password, email:email, photo:photo, number:number, address:address, zipcode:zipcode, city:city, canteat: canteat, bio: bio, role: role, isAvailable: isAvailable, createdAt: createdAt)
    }
}
