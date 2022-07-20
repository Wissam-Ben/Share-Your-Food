//
//  FoodService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation

protocol PlateService {
    func fetchPlates(completion: @escaping ([Plate]) -> Void) -> Void
    func fetchPlateById(plateId: Int, completion: @escaping (PlateByIdResponse) -> Void) -> Void
    func addPlate(plate: PlateRequest, completion: @escaping ([PlateRequest]) -> Void) -> Void
    func editPlate(plateId: Int, newplate: PlateRequest, completion: @escaping ([PlateRequest]) -> Void) -> Void
    func deletePlate(plateId: Int, completion: @escaping ([PlateRequest]) -> Void) -> Void
}
