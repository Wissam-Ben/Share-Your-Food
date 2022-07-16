//
//  UserLoginResponse.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/07/2022.
//

import Foundation

class UserLoginResponse {
        var token: String
        var user: User
        
        
        init(token: String, user: User) {
            self.token = token
            self.user = user
        }
        
        convenience init?(dict: [String: Any]) {
            guard let token = dict["token"] as? String,
                  let user = dict["user"] as? User else {
                return nil
            }
            self.init(token: token, user: user)
        }
}
