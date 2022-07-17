//
//  ReservationWebService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 16/07/2022.
//

import Foundation

class ReservationWebService: ReservationService {
    
    func fetchReservationsOfPlate(plateId: Int, completion: @escaping ([Reservation]) -> Void) {
        let url = URL(string: "http://localhost:3000/reservations/" + plateId.description)
        var request = URLRequest(url: url!)
        
        let token = "$2b$05$Sfc0OsNv7SzRjHnGqZf7auexbmPfBO6SY2zV.W1KpV13QKInvGpL."
        
        let authorization = "Bearer ".appending(token)
        request.httpMethod = "GET"
        request.addValue(authorization, forHTTPHeaderField: "Authorization")
        

        let dataTask = URLSession.shared.dataTask(with: request) {
            data, res, err in

            guard let fetchData = data,
                 let json = try? JSONSerialization.jsonObject(with: fetchData) as? [[String: Any]]
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
            
            DispatchQueue.main.async {
                completion(reservations)
            }
        }
        dataTask.resume()
    }
    
    func addReservation(reservation: ReservationRequest, completion: @escaping ([PlateRequest]) -> Void) {
        let url = URL(string: "http://localhost:3000/reservations")
        let token = "$2b$05$JlrgxiPVf6rOjq1OL3nQU.IXH00IHQZmHYUneLTsHeUCMDPE4Dhs."
        let authorization = "Bearer ".appending(token)
        
        let uploadDataModel = ReservationRequest(plateId: reservation.plateId)
              
          // Convert model to JSON data
          guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
              print("Error: Trying to convert model to JSON data")
              return
          }

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        request.addValue(authorization, forHTTPHeaderField: "Authorization")
       
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Couldn't print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
}
