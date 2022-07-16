//
//  AuthenticationService.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 16/07/2022.
//

import Foundation

protocol AuthenticationService {
    func login(completion: @escaping ([UserLoginResponse]) -> Void, user: UserLogin)
    func subscribe(completion: @escaping ([UserSubscribeResponse]) -> Void, user: UserSubscribe)
}
