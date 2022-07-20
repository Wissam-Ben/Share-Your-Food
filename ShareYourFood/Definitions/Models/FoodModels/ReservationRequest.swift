//
//  ReservationRequest.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 17/07/2022.
//

import Foundation

class ReservationRequest : Codable {
    var plateId: Int
    
    
    init(plateId: Int) {
        self.plateId = plateId
    }
    
    
    convenience init?(dict: [String: Any]) {
        guard let plateId = dict["PlateId"] as? Int else {
            return nil
        }
        self.init(plateId: plateId)
    }
}
