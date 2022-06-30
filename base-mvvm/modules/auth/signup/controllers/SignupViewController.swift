//
//  SignupViewController.swift
//  social_network
//
//  Created by David Granado Jordan on 6/28/22.
//

import UIKit

class SignupViewController: UIViewController {

    let firebaseManager = FirebaseManager.shared

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
    }
    
    @IBAction func addUser(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let age = Int(ageTextField.text ?? "18") ?? 18
        let email = emailTextField.text ?? "test@user.com"
        let pass = passwordTextField.text ?? "pass"
        
        SignUpViewModel.shared.addUser(name: name, age: age, email: email, password: pass) { result in
            switch result {
            case .success(let user):
                print("Success", user)
                self.navigationController?.popViewController(animated: true)
            case .failure(let error):
                print("Error", error)
            }
        }
    }

}
