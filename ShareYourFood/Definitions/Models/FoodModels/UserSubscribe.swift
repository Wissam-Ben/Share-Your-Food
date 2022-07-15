//
//  User.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation
//id?      : number;
//   firstname: string;
//   lastname : string;
//   username : string;
//   password : string;
//   email    : string;
//   photo?   : string;
//   number?  : string;
//   address? : string;
//   zipcode? : number;
//   city?    : string;
//   cantEat? : string;
//   bio?     : string;
//   role     : number;
//   isAvailable: boolean;
class UserSubscribe {
    
    var id: Int
    var firstname: String
    var lastname: String
    var username: String
    var password: String
    var email: String
    var photo: String
    var number: String
    var address: String
    var zipcode: Int
    var city: String
    var canteat: String
    var bio: String
    var role: Int
    var isAvailable: Bool
    
    init(id: Int, firstname: String, lastname: String, username: String, password: String, email: String, photo: String, number: String, address: String, zipcode: Int, city: String, canteat: String, bio: String, role: Int, isAvailable: Bool) {
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
              let address = dict["ingredient"] as? String,
              let zipcode = dict["zipcode"] as? Int,
              let city = dict["city"] as? String,
              let canteat = dict["canteat"] as? String,
              let bio = dict["bio"] as? String,
              let role = dict["role"] as? Int,
              let isAvailable = dict["isAvailable"] as? Bool else {
            return nil
        }
        self.init(id: id, firstname: firstname, lastname: lastname, username: username, password: password, email:email, photo:photo, number:number, address:address, zipcode:zipcode, city:city, canteat:canteat, bio:bio, role:role, isAvailable:isAvailable)
    }
}
