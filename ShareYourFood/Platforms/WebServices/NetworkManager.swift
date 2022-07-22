//
//  NetworkManager.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 22/07/2022.
//

import Foundation
import Alamofire
import PromiseKit
import UIKit
import AWSS3

class NetworkManager {
    
    static let api = NetworkManager()
    
    private init() {}
    
    func uploadImage(image: UIImage) -> Promise<URL> {
        return Promise { resolver in
            let progressBlock: AWSS3TransferUtilityProgressBlock = {
                task, progress in
                print("image uploaded percentage : ", progress.fractionCompleted)
            }
            let name = ProcessInfo.processInfo.globallyUniqueString+".jpg"
            let transferUtility = AWSS3TransferUtility.default()
            let imageData = image.jpegData(compressionQuality: 0.4)
            let bucketName = "share-your-food"
            let expression = AWSS3TransferUtilityUploadExpression()
            expression.progressBlock = progressBlock
            
            transferUtility.uploadData(imageData!, key: bucketName, contentType: "image/jpeg", expression: expression) {
                task, error in
                
                if let error = error {
                    resolver.reject(error)
                } else {
                    let imageUrl = URL(string: "https://\(bucketName).s3.amazonaws.com/\(name)") // halisia
                    resolver.fulfill(imageUrl!)
                }
                
            }
        }
    }
    
}
