//
//  AddPlateViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import UIKit
import Alamofire
import PromiseKit
import UIKit
import AWSS3

class AddPlateViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var plateImage: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    @IBOutlet weak var portionTextField: UITextField!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBOutlet weak var publishButton: UIButton!
    
    var imageStr: String!
    
    var plateService: PlateService = PlateWebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("addplate.title", comment: "")
        self.plateImage.layer.borderWidth = 1
        self.plateImage.layer.borderColor = UIColor.black.cgColor
        
        self.nameTextField.delegate = self
        self.quantityTextField.delegate = self
        self.portionTextField.delegate = self
        self.commentTextField.delegate = self
        
        //self.handlePublishPlate(self.publishButton)
        

    }

    @IBAction func handleCamera(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
    @IBAction func handleGallery(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            return
        }
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    @IBAction func handlePublishPlate(_ sender: Any) {
        guard let name = self.nameTextField.text,
                let number = self.quantityTextField.text,
                let portion = self.portionTextField.text,
              let comment = self.commentTextField.text else {
            self.displayErrorMessage(title: NSLocalizedString("invalid.form.message", comment: ""), message: NSLocalizedString("missing.field.message", comment: ""))
            return
        }
        
        //NetworkManager.api.uploadImage(image: self.plateImage.image!)

        //uploadImage(with: "toto", type: "jpg")
        
        self.plateService.addPlate(plate: PlateRequest(name: name, photo: self.imageStr, quantity: portion, number: number, comment: comment, reserved: false, userId: MyVariables.id.description)) { requestResponse in
            print(requestResponse)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        self.plateImage.image = image
        picker.dismiss(animated: true)
        
        let request = uploadImage(image: self.plateImage.image!)
        request.done {
            url in
            print("succes : ", url)
        }.catch {
            error in
            print("error description : ", error.localizedDescription)
        }
        
    }
    
    func displayErrorMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("close", comment: ""), style: .cancel))
        self.present(alert, animated: true) {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false){ _ in
                alert.dismiss(animated: true)
            }
        }
    }
    
    
    func uploadImage(image: UIImage) -> Promise<URL> {
        return Promise { resolver in
            let progressBlock: AWSS3TransferUtilityProgressBlock = {
                task, progress in
                print("image uploaded percentage : ", progress.fractionCompleted)
            }
            let name = ProcessInfo.processInfo.globallyUniqueString+".jpg"
            //self.imageStr = name
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
                    let imageUrl = URL(string: "https://\(bucketName).s3.amazonaws.com/\(name)")
                    resolver.fulfill(imageUrl!)
                    self.imageStr = String("https://\(bucketName).s3.amazonaws.com/\(name)")
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
    
    
    
    func uploadS3(image: UIImage,
                  name: String,
                  progressHandler: @escaping (Progress) -> Void,
                  completionHandler: @escaping (Error?) -> Void) {
        
        // Configure AWS Cognito Credentials
        
//        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "us-east-1:4d930ef9-d523-47a7-9c83-38df908ad21e")
//        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialsProvider)
//        AWSServiceManager.default().defaultServiceConfiguration = configuration
//
//        
        guard let data = image.jpegData(compressionQuality: 0.4) else {
            print("errrroooorrr")
            return
        }
        
        print(data.base64EncodedString())

        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = { task, progress in
            DispatchQueue.main.async {
                progressHandler(progress)
            }
        }

        print("expression")
        
        AWSS3TransferUtility.default().uploadData(
            data,
            key: "share-your-food",
            contentType: "image/jpg",
            expression: expression) { task, error in
                DispatchQueue.main.async {
                    completionHandler(error)
                }
                print("Success")

            }.continueWith { task -> AnyObject? in
                if let error = task.error {
                    DispatchQueue.main.async {
                        completionHandler(error)
                    }
                }
                return nil
        }
    }
    
    
    let bucketName = "share-your-food"
    var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?

    func uploadImagess(with resource: String,type: String){   //1
            
            let key = "\(resource).\(type)"
            let resource = Bundle.main.path(forResource: resource, ofType: type)!
            let Url = URL(fileURLWithPath: resource)
            
            let expression  = AWSS3TransferUtilityUploadExpression()
            expression.progressBlock = { (task: AWSS3TransferUtilityTask,progress: Progress) -> Void in
              print(progress.fractionCompleted)   //2
              if progress.isFinished{           //3
                print("Upload Finished...")
                //do any task here.
              }
            }
            
            expression.setValue("public-read-write", forRequestHeader: "x-amz-acl")   //4
            expression.setValue("public-read-write", forRequestParameter: "x-amz-acl")

            completionHandler = { (task:AWSS3TransferUtilityUploadTask, error:NSError?) -> Void in
                if(error != nil){
                    print("Failure uploading file")
                    
                }else{
                    print("Success uploading file")
                }
            } as? AWSS3TransferUtilityUploadCompletionHandlerBlock
            
            
            //5
            AWSS3TransferUtility.default().uploadFile(Url, bucket: bucketName, key: key, contentType: resource, expression: expression, completionHandler: self.completionHandler).continueWith(block: { (task:AWSTask) -> AnyObject? in
                if(task.error != nil){
                    print("Error uploading file: \(String(describing: task.error?.localizedDescription))")
                }
                if(task.result != nil){
                    print("Starting upload...")
                }
                return nil
            })
        }
    
}
