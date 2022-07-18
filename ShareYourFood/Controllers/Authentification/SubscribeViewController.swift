//
//  SubscribeViewController.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 06/06/2022.
//

import UIKit

class SubscribeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstnameTextField: UITextField!
    
    @IBOutlet weak var lastnameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var subscribeButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginTextView: UILabel!
    var authenticationService: AuthenticationService {
        return AuthenticationWebService()
    }
    
    var user: UserSubscribe!
    var userResponse: UserSubscribeResponse!
    
    var token: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.title = NSLocalizedString("subscribe.title", comment: "")
        self.subscribeButton.setTitle(NSLocalizedString("subscribe.button", comment: ""), for: UIControl.State.normal)
        self.loginButton.setTitle(NSLocalizedString("login.button", comment: ""), for: UIControl.State.normal)
        self.loginTextView.text = NSLocalizedString("login.message", comment: "")
        self.firstnameTextField.placeholder = NSLocalizedString("firstname", comment: "")
        self.lastnameTextField.placeholder = NSLocalizedString("lastname", comment: "")
        self.usernameTextField.placeholder = NSLocalizedString("username", comment: "")
        self.emailTextField.placeholder = NSLocalizedString("email", comment: "")
        self.passwordTextField.placeholder = NSLocalizedString("password", comment: "")
        self.firstnameTextField.delegate = self
        self.lastnameTextField.delegate = self
        self.usernameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.handleSubscribe(self.subscribeButton!)
    }
    
    @IBAction func handleSubscribe(_ sender: Any) {
        guard let firstname = self.firstnameTextField.text,
              let lastname = self.lastnameTextField.text,
              let username = self.usernameTextField.text,
              let email = self.emailTextField.text,
              let password = self.passwordTextField.text else {
                self.displayErrorMessage(title: "Formulaire invalide", message: "Les champs sont obligatoires")
                return
        }
        
        guard firstname.count >= 2 else { self.displayErrorMessage(title: "Formulaire invalide", message: "Le login doit contenir au moins 4 caractères")
            return
        }
        
        guard lastname.count >= 4 else { self.displayErrorMessage(title: "Formulaire invalide", message: "Le login doit contenir au moins 4 caractères")
            return
        }
        
        guard email.count >= 4 else { self.displayErrorMessage(title: "Formulaire invalide", message: "Le login doit contenir au moins 4 caractères")
            return
        }
        
        guard username.count >= 4 else { self.displayErrorMessage(title: "Formulaire invalide", message: "Le login doit contenir au moins 4 caractères")
            return
        }
        
        guard password.count >= 6 else { self.displayErrorMessage(title: "Formulaire invalide", message: "Le mot de passe doit contenir au moins 4 caractères")
            return
        }
        
        self.user = UserSubscribe(firstname: firstname, lastname: lastname, username: username, password: password, email: email)
        self.authenticationService.subscribe(completion: { UserSubscribeResponse in
            self.userResponse = UserSubscribeResponse
            print(UserSubscribeResponse)
        }, user: self.user)
        
        self.navigationController?.pushViewController(SearchRecipeCategoriesListViewController(), animated: true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.usernameTextField {
            self.passwordTextField.becomeFirstResponder()
        }
        if textField == self.passwordTextField {
            self.passwordTextField.resignFirstResponder()
            self.handleSubscribe(self.loginButton!)
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
    
    @IBAction func login(_ sender: Any) {
        self.navigationController?.pushViewController(LogInViewController(), animated: true)
    }
    
}
