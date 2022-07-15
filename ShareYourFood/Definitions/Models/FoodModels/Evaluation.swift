//
//  UserEvaluation.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

class Evaluation {
    var id: Int
    var date: String
    var rate: Bool
    var comment: String
    var photo: String
    var UserId: Int
    var ReservationId: Int
    
    
    internal init(id: Int, date: String, rate: Bool, comment: String, photo: String, UserId: Int, ReservationId: Int) {
        self.id = id
        self.date = date
        self.rate = rate
        self.comment = comment
        self.photo = photo
        self.UserId = UserId
        self.ReservationId = ReservationId
    }
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let date = dict["date"] as? String,
              let rate = dict["rate"] as? Bool,
              let comment = dict["comment"] as? String,
              let photo = dict["photo"] as? String,
              let UserId = dict["UserId"] as? Int,
              let ReservationId = dict["ReservationId"] as? Int else {
            return nil
        }
        self.init(id: id, date: date, rate: rate, comment: comment, photo: photo, UserId: UserId, ReservationId: ReservationId)
    }
}
