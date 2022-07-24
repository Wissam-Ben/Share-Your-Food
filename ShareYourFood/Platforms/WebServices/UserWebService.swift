//
//  UserWebService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import Foundation

class UserWebService: UserService {
    func fetchUserById(userId:String, completion: @escaping (User) -> Void) {
        let url = URL(string: "http://localhost:3000/users/6")
        
        var request = URLRequest(url: url!)
        
        let token = "$2b$05$Q69XX.2a6HyKievVOzXRpOJePqc17yyodUS.G7VoqLlXm9DQg5gi."
        
        let authorization = "Bearer ".appending(token)
        request.httpMethod = "GET"
        request.addValue(authorization, forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: request) {
            data, res, err in
           
            guard let fetchData = data,
                 let json = try? JSONSerialization.jsonObject(with: fetchData) as? [String: Any],
            let user: User = User(dict: json)
            else {
                Dispatch.DispatchQueue.main.async {
                    print("completion!!!!!")
                }
                    return
            }
            
            print(json)
            
            DispatchQueue.main.async {
                completion(user)
            }
        }
        dataTask.resume()
    }
    
}
