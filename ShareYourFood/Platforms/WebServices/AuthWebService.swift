//
//  AuthWebService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 15/07/2022.
//

import Foundation


class AuthWebService: AuthService {
    func fetchUsers(completion: @escaping ([UserSubscribe]) -> Void) {
        let url = URL(string: "http://localhost:3000/users")
        var request = URLRequest(url: url!)
        
        let token = "$2b$05$9CXm5G5aPe8WxwUry5HNQeMo2cAsGNNjiQ6oUqc6//jopUvpEXVZa"
        
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
    
            
           let users: [UserSubscribe] = json.compactMap {obj in
            print(obj)
                return UserSubscribe(dict: obj)
            }
            
            print(users)
            
            DispatchQueue.main.async {
                completion(users)
            }
        }
        dataTask.resume()
    }




   
}
