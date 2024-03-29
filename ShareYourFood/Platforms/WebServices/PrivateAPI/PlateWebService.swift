//
//  FoodWebService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 23/06/2022.
//

import Foundation
import UIKit

class PlateWebService: PlateService {
    
    func fetchPlates(completion: @escaping ([PlateResponse]) -> Void) {
        
        //UserDefaults.init()
        
        let url = URL(string: "http://localhost:3000/plates")
        var request = URLRequest(url: url!)

        let token = UserDefaults.standard.string(forKey: MyVariables.token)
        
        let authorization = "Bearer ".appending(token!)
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
           let plates: [PlateResponse] = json.compactMap {obj in
            return PlateResponse(dict: obj)
            }
            DispatchQueue.main.async {
                completion(plates)
            }
        }
        dataTask.resume()
    }
    
    func fetchPlateById(plateId: Int, completion: @escaping (PlateByIdResponse) -> Void) {
        let url = URL(string: "http://localhost:3000/plates/" + plateId.description)
        
        var request = URLRequest(url: url!)
        
        let token = UserDefaults.standard.string(forKey: MyVariables.token)
        
        let authorization = "Bearer ".appending(token!)
        request.httpMethod = "GET"
        request.addValue(authorization, forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: request) {
            data, res, err in
           
            guard let fetchData = data,
                 let json = try? JSONSerialization.jsonObject(with: fetchData) as? [String: Any],
            let plate: PlateByIdResponse = PlateByIdResponse(dict: json)
            else {
          
                Dispatch.DispatchQueue.main.async {
                    //completion(plate)
                }
                    return
            }
            DispatchQueue.main.async {
                completion(plate)
            }
        }
        dataTask.resume()
    }
    
    func addPlate(plate: PlateRequest, completion: @escaping ([PlateRequest]) -> Void) {
        let url = URL(string: "http://localhost:3000/plates")
        let token = UserDefaults.standard.string(forKey: MyVariables.token)
        let authorization = "Bearer ".appending(token!)
        
        let uploadDataModel = PlateRequest(name: plate.name, photo: plate.photo, quantity: plate.quantity, number: plate.number, comment: plate.comment, reserved: plate.reserved, userId: plate.userId)
              
          // Convert model to JSON data
          guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
              print("Error: Trying to convert model to JSON data")
              return
          }

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
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
            print(response?.description)
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
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    func editPlate(plateId: Int, newplate: PlateRequest, completion: @escaping ([PlateRequest]) -> Void) {
        let url = URL(string: "http://localhost:3000/plates/"+plateId.description)
        let token = UserDefaults.standard.string(forKey: MyVariables.token)
        let authorization = "Bearer ".appending(token!)
        
        let newPlate = PlateRequest(name: newplate.name, photo: newplate.photo, quantity: newplate.quantity, number: newplate.number, comment: newplate.comment, reserved: newplate.reserved, userId: newplate.userId)
              
          // Convert model to JSON data
          guard let jsonData = try? JSONEncoder().encode(newPlate) else {
              print("Error: Trying to convert model to JSON data")
              return
          }

        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
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
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    func deletePlate(plateId: Int, completion: @escaping ([PlateRequest]) -> Void) {
        let url = URL(string: "http://localhost:3000/plates/"+plateId.description)
        let token = UserDefaults.standard.string(forKey: MyVariables.token)
        let authorization = "Bearer ".appending(token!)
        
                
        var request = URLRequest(url: url!)
        request.httpMethod = "DELETE"
        request.addValue(authorization, forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling DELETE")
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
                    print("Error: Cannot convert data to JSON")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
}



