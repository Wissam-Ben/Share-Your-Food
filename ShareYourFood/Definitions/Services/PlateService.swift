//
//  FoodService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

protocol PlateService {
    func fetchPlates(completion: @escaping ([Plate]) -> Void) -> Void
    func addPlate(completion: @escaping ([PlateRequest]) -> Void) -> Void
}
