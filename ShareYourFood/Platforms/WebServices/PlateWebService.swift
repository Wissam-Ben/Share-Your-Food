//
//  FoodWebService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation


class PlateWebService: PlateService {
    
    
    func fetchPlates(completion: @escaping ([Plate]) -> Void) {
        let url = URL(string: "http://localhost:3000/plates")
        var request = URLRequest(url: url!)
        
        let token = "$2b$05$9CXm5G5aPe8WxwUry5HNQeMo2cAsGNNjiQ6oUqc6//jopUvpEXVZa"
        
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
    
           let plates: [Plate] = json.compactMap {obj in
               print(obj)
            return Plate(dict: obj)
            }
            
            DispatchQueue.main.async {
                completion(plates)
            }
        }
        dataTask.resume()//OBLIGATOIRE pour lancer la requete
    }
    
    func addPlate(completion: @escaping ([Plate]) -> Void) {
        let url = URL(string: "http://localhost:3000/plates")
        var request = URLRequest(url: url!)
        
        let token = "$2b$05$WrR/dKo3Pa6i8cm4h9EEe.Xits/GiHxiNvVGq8s72Ect7D2gACM2e"
        
        let authorization = "Bearer ".appending(token)
        
        let body:[String:Any] = [
            "name": "Tagliatelles au saumon",
            "photo":"",
            "quantity":300,
            "number":3,
            "comment":"plat fait par wissam",
            "reserved":false,
            "UserId":5]
        
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )
        
        request.httpBody = bodyData
        request.httpMethod = "POST"
        request.addValue(authorization, forHTTPHeaderField: "Authorization")
        
        
        let dataTask = URLSession.shared.dataTask(with: request) {
            data, res, err in
           

            if let error = err {
                print("error")
                // Handle HTTP request error
            } else if let data = data {
                print(data)
                // Handle HTTP request response
            } else {
                print("else")
                // Handle unexpected error
            }
            
    }
        dataTask.resume()

    }
}



