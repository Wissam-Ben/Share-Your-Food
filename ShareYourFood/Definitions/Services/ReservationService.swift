//
//  ReservationService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 15/07/2022.
//

import Foundation

protocol ReservationService {
    func fetchReservationsOfPlate(plateID: Int, completion: @escaping ([Reservation]) -> Void) -> Void
}
