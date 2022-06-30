//
//  LoginViewController.swift
//  social_network
//
//  Created by David Granado Jordan on 6/28/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signIn(_ sender: Any) {
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        let vc = SignupViewController()
        show(vc, sender: nil)
    }
    
}
