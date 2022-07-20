//
//  PhotoResponse.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 17/07/2022.
//

import Foundation

class PhotoResponse  {
    
    let type: String
    let data: [Int]
    
    init(type: String, data: [Int]) {
        self.type = type
        self.data = data
    }
    
    convenience init?(dict: [String: Any]) {
        guard let type = dict["type"] as? String,
              let data = dict["data"] as? [Int] else {
            
            return nil
        }
        self.init(type: type, data: data)
    }
}
