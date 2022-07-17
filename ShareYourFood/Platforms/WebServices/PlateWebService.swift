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
    
    func addPlate(completion: @escaping ([PlateRequest]) -> Void) {
        let url = URL(string: "http://localhost:3000/plates")
        let token = "$2b$05$WrR/dKo3Pa6i8cm4h9EEe.Xits/GiHxiNvVGq8s72Ect7D2gACM2e"
        let authorization = "Bearer ".appending(token)
        
        struct PlateSent: Codable {
            var name: String
            var photo: String
            var quantity: Int
            var number: Int
            var comment: String
            var reserved: Bool
            var userId: Int
               }
        
        let uploadDataModel = PlateRequest(name: "Tagliatelles au saumon", photo: "", quantity: 300, number: 3, comment: "Plat fait par wiwi", reserved: false, userId: 5)
              
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



