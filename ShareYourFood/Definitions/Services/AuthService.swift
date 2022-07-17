//
//  AuthService.swift
//  ShareYourFood
//
//  Created by Halifa Halisia on 15/07/2022.
//

import Foundation

protocol AuthService {
    func fetchUsers(completion: @escaping ([UserSubscribe]) -> Void) -> Void
}
