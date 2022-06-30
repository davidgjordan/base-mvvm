//
//  LoginViewController.swift
//  social_network
//
//  Created by David Granado Jordan on 6/28/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signIn(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let pass = passwordTextField.text ?? ""
        LoginViewModel.shared.login(email: email, password: pass) { result in
            switch result {
            case .success(let user):
                print("User", user)
                SceneDelegate.shared?.setupRootControllerIfNeeded(validUser: true)
            case .failure(let error):
                print("Error", error)
            }
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        let vc = SignupViewController()
        show(vc, sender: nil)
    }
    
}
