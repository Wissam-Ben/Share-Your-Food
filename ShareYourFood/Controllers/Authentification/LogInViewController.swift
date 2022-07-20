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
    
    @IBOutlet weak var subscribeButton: UIButton!
    
    @IBOutlet weak var subscribeTextView: UILabel!
    
    var authenticationService: AuthenticationService {
        return AuthenticationWebService()

    }
    var user: UserLogin!
    var userResponse: UserLoginResponse!
    var userAccount: User!
    
    var authService: AuthService {
            return AuthWebService()
    }
    
    var reservationService: ReservationService {
            return ReservationWebService()
    }
    
    //var plate: PlateByIdResponse = 
    var plates: [Plate] = []
    var users: [UserSubscribe] = []
    var reservations: [Reservation] = []

    //var token: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.title = NSLocalizedString("login.title", comment: "")
        self.loginButton.setTitle(NSLocalizedString("login.button", comment: ""), for: UIControl.State.normal)
        self.subscribeButton.setTitle(NSLocalizedString("subscribe.button", comment: ""), for: UIControl.State.normal)
        self.subscribeTextView.text = NSLocalizedString("subscribe.message", comment: "")
        self.usernameTextField.placeholder = NSLocalizedString("username", comment: "")
        self.passwordTextField.placeholder = NSLocalizedString("password", comment: "")
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
        
        self.user = UserLogin(username: log, password: pwd)
        self.authenticationService.login(completion: { response in
            //print(response)
            self.userResponse = response
            MyVariables.token = response.token
            print(MyVariables.token)
            
        }, user: self.user)
        
        let vc = UIStoryboard(name: "Navigation", bundle: nil).instantiateInitialViewController() as? UIViewController
        
        if(MyVariables.token != "") {
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            self.displayErrorMessage(title: "Formulaire invalide", message: "L'identifiant et le mot de passe sont incorrectes")
                return
        }
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
    
    
    @IBAction func subscribe(_ sender: Any) {
        self.navigationController?.pushViewController(SubscribeViewController(), animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
