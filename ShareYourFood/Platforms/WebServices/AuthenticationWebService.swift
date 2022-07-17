//
//  AuthenticationWebService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/07/2022.
//

import Foundation

class AuthenticationWebService: AuthenticationService {
  
    func login(completion: @escaping (UserLoginResponse) -> Void, user: UserLogin) {
        let url = URL(string: "http://localhost:3000/auth/login")!
        var request = URLRequest(url: url)
        
        guard let jsonData = try? JSONEncoder().encode(user) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        let body = user.toJSON()
        
        let finalBody = try? JSONSerialization.data(withJSONObject: body)
        
        request.httpMethod = "POST"
        request.httpBody = finalBody

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                    print(error)
                    // Handle HTTP request error
                } else if let data = data {
                    print(data)
                    // Handle HTTP request response
                } else {
                    print("errrooooooor")
                    // Handle unexpected error
                }
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
                print(response)
            }
        }

        task.resume()
        
    }
    
    func subscribe(completion: @escaping (UserSubscribeResponse) -> Void, user: UserSubscribe) {
        let url = URL(string: "http://localhost:3000/auth/subscribe")!
        var request = URLRequest(url: url)
        
        guard let jsonData = try? JSONEncoder().encode(user) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        request.httpMethod = "POST"
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
        }

        task.resume()
    }
}
