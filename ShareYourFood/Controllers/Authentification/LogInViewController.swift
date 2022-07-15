//
//  LogInViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 12/07/2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var foodService: FoodService {
            return FoodWebService()
    }
    
    var plates: [Plate] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.title = NSLocalizedString("login.title", comment: "")
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        self.handleLogin(self.loginButton!)
    }
    
    
    @IBAction func handleLogin(_ sender: Any) {
        guard let log = self.usernameTextField.text, let pwd = self.passwordTextField.text else {
            self.displayErrorMessage(title: "Formulaire invalide", message: "Les champs sont obligatoires")
            return
        }
        
        guard log.count >= 4 else { self.displayErrorMessage(title: "Formulaire invalide", message: "Le login doit contenir au moins 4 caractères")
            return
        }
        
        guard pwd.count >= 6 else { self.displayErrorMessage(title: "Formulaire invalide", message: "Le mot de passe doit contenir au moins 4 caractères")
            return
        }
        
        self.foodService.fetchPlates { plate in
           
            self.plates = plate
        
        }
        
        self.navigationController?.pushViewController(SearchRecipeCategoriesListViewController(), animated: true)
        

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.usernameTextField {
            self.passwordTextField.becomeFirstResponder()
        }
        if textField == self.passwordTextField {
            self.passwordTextField.resignFirstResponder()
            self.handleLogin(self.loginButton!)
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
    

}
