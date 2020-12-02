//
//  ViewController.swift
//  Prueba
//
//  Created by maria jose acosta palma on 28-09-20.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTappe))
        
        view.addGestureRecognizer(tapGesture)
    }


    @IBAction func logInButtonPressed(_ sender: UIButton) {
    
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "Incorrect username or password.", message: "", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(accion)
                
                self.present(alert, animated: true, completion: nil)
            }
            else {
                
                let alert = UIAlertController(title: "Login Success!", message: "", preferredStyle: .alert)
                
                self.performSegue(withIdentifier: "goToConfiguration", sender: self)
                
                self.present(alert, animated: true, completion: nil)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.dismiss(animated: true, completion: nil)
                }
                                
            }
            
        }
        
    }
    

    @IBAction func resetPasswordButton(_ sender: UIButton) {
    
        self.performSegue(withIdentifier: "goToResetPassword", sender: self)
        
    }
    
    @IBAction func singUpButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToSignUp", sender: self)
    }
    
    @objc func tableViewTappe() {
        
        view.endEditing(true)
    }
    
}

