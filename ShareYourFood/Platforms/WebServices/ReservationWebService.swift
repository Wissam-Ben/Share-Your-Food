//
//  ReservationWebService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 16/07/2022.
//

import Foundation

class ReservationWebService: ReservationService {
    func fetchReservationsOfPlate(plateID: Int, completion: @escaping ([Reservation]) -> Void) {
        let url = URL(string: "http://localhost:3000/reservations/" + plateID.description)
        var request = URLRequest(url: url!)
        
        let token = "$2b$05$Sfc0OsNv7SzRjHnGqZf7auexbmPfBO6SY2zV.W1KpV13QKInvGpL."
        
        let authorization = "Bearer ".appending(token)
        request.httpMethod = "GET"
        request.addValue(authorization, forHTTPHeaderField: "Authorization")
        

        let dataTask = URLSession.shared.dataTask(with: request) {
            data, res, err in

            guard let fetchData = data,
                 let json = try? JSONSerialization.jsonObject(with: fetchData) as? [[String: Any]]
//
            else {
                Dispatch.DispatchQueue.main.async {
                    completion([])
                }
                    return
            }
            

            let reservations: [Reservation] = json.compactMap {obj in
                print(obj)
                return Reservation(dict: obj)
            }
            //let reservations: [Reservation] = json
             
            
            print(reservations)
            //OBLIGATOIRE pour executer le callback sur le thread principal
            DispatchQueue.main.async {
                completion(reservations)
            }
        }
        dataTask.resume()//OBLIGATOIRE pour lancer la requete
    }

}
