//
//  RegisterViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 06/06/2022.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var RegisterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = "Subscribe"
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    
    @IBAction func handleRegister(_ sender: Any) {
        guard let email = self.emailTextField.text, let password = self.passwordTextField.text else {
            self.displayErrorMessage(title: "Formulaire invalide", message: "Les champs sont obligatoires")
            return
        }
        guard email.count >= 4 else { self.displayErrorMessage(title: "Formulaire invalide", message: "L'email n'est pas conforme")
            return
        }
        
        guard password.count >= 6 else { self.displayErrorMessage(title: "Formulaire invalide", message: "Le mot de passe n'est pas conforme")
            return
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailTextField {
            self.passwordTextField.becomeFirstResponder()
        }
        if textField == self.passwordTextField {
            self.passwordTextField.resignFirstResponder()
            self.handleRegister(self.RegisterButton!)
        }
        return true
    }
    
    func displayErrorMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Fermer", style: .cancel))
        self.present(alert, animated: true) {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false){ _ in
                alert.dismiss(animated: true)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
