//
//  LoginViewController.swift
//  Navigate
//
//  Created by 姜天启 on 2017-10-23.
//  Copyright © 2017 Dream Chasers. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var loginSelector: UISegmentedControl!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    var isLoggedin:Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginSelectorChanged(_ sender: UISegmentedControl) {
        isLoggedin = !isLoggedin
        
        if isLoggedin {
            loginLabel.text = "User Login"
            loginButton.setTitle("Login", for: .normal)
        }else{
            loginLabel.text = "Register"
            loginButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func userLoggedIn(_ sender: UIButton) {
        self.errorMessage.isHidden = true
        if let email = emailTextField.text, let pass = passwordTextField.text{
            if isLoggedin{
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    if let u = user{
                        self.performSegue(withIdentifier: "goToHomePage", sender: self)
                    }else{
                        self.errorMessage.text = "Invalid email or password"
                        self.errorMessage.isHidden = false
                    }
                })
                
            }else{
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    if let u = user{
                        self.performSegue(withIdentifier: "goToHomePage", sender: self)
                    }else{
                        self.errorMessage.text = "Invalid email."
                        self.errorMessage.isHidden = false
                    }
                })
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

}
