//
//  FoodService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

protocol FoodService {
    func fetchPlates(completion: @escaping ([Plate]) -> Void) -> Void
}
