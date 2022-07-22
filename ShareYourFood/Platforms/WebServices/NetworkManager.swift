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
    
    var imageName = ""
    
    private init() {}
    
    func uploadImage(image: UIImage) -> Promise<URL> {
        return Promise { resolver in
            let progressBlock: AWSS3TransferUtilityProgressBlock = {
                task, progress in
                print("image uploaded percentage : ", progress.fractionCompleted)
            }
            let name = ProcessInfo.processInfo.globallyUniqueString+".jpg"
            self.imageName = name
            let transferUtility = AWSS3TransferUtility.default()
            let imageData = image.jpegData(compressionQuality: 0.4)
            let bucketName = "share-your-food"
            let expression = AWSS3TransferUtilityUploadExpression()
            expression.progressBlock = progressBlock
            
            transferUtility.uploadData(imageData!, bucket: String(bucketName), key: name, contentType: "image/jpeg", expression: expression) {
                task, error in
                
                if let error = error {
                    resolver.reject(error)
                } else {
                    let imageUrl = URL(string: "https://\(bucketName).s3.amazonaws.com/\(name)") // halisia
                    resolver.fulfill(imageUrl!)
                }
                
            }.continueWith {
                (task:AWSTask) -> AnyObject? in
                    if(task.error != nil){
                        print("Error uploading file: \(String(describing: task.error?.localizedDescription))")
                    }
                    if(task.result != nil){
                        print("Starting upload...")
                    }
                    return nil
                }
            }
    }
    
    func downloadImage() {
        let S3BucketName: String = "share-your-food"
        let S3DownloadKeyName: String = "ACF6F4DB-1208-43C2-94F0-CCB8AB952C5C-87452-0000034534239CA5.jpg"
                
                
                
         
    }
}
