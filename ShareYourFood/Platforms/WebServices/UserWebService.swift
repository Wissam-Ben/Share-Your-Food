//
//  UserWebService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import Foundation

class UserWebService: UserService {
    func fetchUserById(userId: Int) -> User {
        var users: [User]!
        
        self.fetchUsers { usersRes in
            users = usersRes
        }
        
        for user in users {
            if (userId == user.id) {
                return user
            }
        }
        return User(id: 0, firstname: "error", lastname: "error", username: "", password: "", email: "")
    }
    
    func fetchUsers(completion: @escaping ([User]) -> Void) {
            let url = URL(string: "http://localhost:3000/users")
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
                
               let users: [User] = json.compactMap {obj in
                   print(obj)
                    return User(dict: obj)
                }
                
                DispatchQueue.main.async {
                    completion(users)
                }
            }
            dataTask.resume()
        }

    
}
