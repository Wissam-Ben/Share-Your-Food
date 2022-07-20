//
//  UserService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import Foundation


protocol UserService {
    func fetchUserById(userId: String, completion: @escaping (User) -> Void) -> Void
}
