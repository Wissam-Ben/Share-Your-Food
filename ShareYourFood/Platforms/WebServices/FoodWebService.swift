//
//  FoodWebService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation


class FoodWebService: FoodService {
    func fetchPlates(completion: @escaping ([Plate]) -> Void) {
        print("plate function")
        let url = URL(string: "http://localhost:3000/plates")
        var request = URLRequest(url: url!)
        
        let token = "$2b$05$NCqGHFDpnNs4saXhBO02TemcsnBnRziNxGXJp3MX9hCJ8sqbZ1wTK"
        
        let authorization = "Bearer ".appending(token)
        request.httpMethod = "GET"
        request.addValue(authorization, forHTTPHeaderField: "Authorization")
        
        
//        guard let url = URL(string: "http://localhost:3000/plates") else {
//            print("failed to fetch plates")
//            completion([])
//            return
//        }
        
        let dataTask = URLSession.shared.dataTask(with: request) {
            data, res, err in
           
            guard let fetchData = data,
                 let json = try? JSONSerialization.jsonObject(with: fetchData) as? [[String: Any]]
//                  let id = json["id"] as? Int,
//                  let name = json["name"] as? String,
//                  let photo = json["photo"] as? String,
//                  let quantity = json["quantity"] as? Int,
//                  let number = json["number"] as? Int,
//                  let comment = json["comment"] as? String,
//                  let reserved = json["reserved"] as? Bool,
//                  let UserId = json["UserId"] as? Int,
//                  let RecipeId = json["RecipeId"] as? Int
            else {
                Dispatch.DispatchQueue.main.async {
                    completion([])
                }
                print(data)
                    return
            }
    
            print(json)
            
           let plates: [Plate] = json.compactMap {obj in
               print(obj)
                return Plate(dict: obj)
            }
            
            print(plates)
            //OBLIGATOIRE pour executer le callback sur le thread principal
            DispatchQueue.main.async {
                completion(plates)
            }
        }
        dataTask.resume()//OBLIGATOIRE pour lancer la requete
    }




    
    func fetchReservations(completion: @escaping ([Reservation]) -> Void) {
        guard let url = URL(string: "http://localhost:3000/reservations") else {
                completion([])
                return
              }
        let dataTask = URLSession.shared.dataTask(with: url) {
            data, res, err in
            
            guard let fetchData = data,
                  let json = try? JSONSerialization.jsonObject(with: fetchData) as? [String: Any],
                  let id = json["id"] as? Int,
                  let date = json["date"] as? String,
                  let received = json["received"] as? Bool,
                  let UserId = json["UserId"] as? Int,
                  let PlateId = json["PlateId"] as? Int else {
                DispatchQueue.main.async {
                    completion([])
                }
                    return
            }
            let reservations: [Reservation] = json.compactMap {obj in
                return Reservation(id: id, date: date, received: received, UserId: UserId, PlateId: PlateId)
            }
            print(reservations)
            //OBLIGATOIRE pour executer le callback sur le thread principal
            DispatchQueue.main.async {
                completion(reservations)
            }
            
        }
        dataTask.resume()
    }
}
