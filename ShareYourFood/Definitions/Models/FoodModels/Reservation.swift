//
//  Reservation.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

class Reservation {
    var id:Int
    var date: String
    var received: Bool
    var UserId:Int
    var PlateId: Int
    //var plate: Plate

    init(id: Int, date: String, received: Bool, UserId: Int, PlateId: Int) {
        self.id = id
        self.date = date
        self.received = received
        self.UserId = UserId
        self.PlateId = PlateId
        //self.plate = plate
    }
    
    convenience init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
              let date = dict["date"] as? String,
              let received = dict["received"] as? Bool,
              let UserId = dict["UserId"] as? Int,
              let PlateId = dict["PlateId"] as? Int
                else {
            return nil
        }
        self.init(id: id, date: date, received: received, UserId: UserId, PlateId: PlateId)
    }
    
}
