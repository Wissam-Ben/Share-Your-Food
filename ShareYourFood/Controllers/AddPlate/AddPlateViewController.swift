//
//  AddPlateViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 20/07/2022.
//

import UIKit

class AddPlateViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var plateImage: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    @IBOutlet weak var portionTextField: UITextField!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.plateImage.layer.borderWidth = 1
        self.plateImage.layer.borderColor = UIColor.black.cgColor
        
        self.nameTextField.delegate = self
        self.quantityTextField.delegate = self
        self.portionTextField.delegate = self
        self.commentTextField.delegate = self
        

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
        guard let name = self.nameTextField.text, let quantity = self.quantityTextField.text, let portion = self.portionTextField.text else {
            self.displayErrorMessage(title: NSLocalizedString("invalid.form.message", comment: ""), message: NSLocalizedString("missing.field.message", comment: ""))
            return
        }
        // requete
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        self.plateImage.image = image
        
        picker.dismiss(animated: true)
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
    
}
