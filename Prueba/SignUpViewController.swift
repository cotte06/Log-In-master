//
//  SignUpViewController.swift
//  Prueba
//
//  Created by maria jose acosta palma on 04-10-20.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "Incorrect username or password.", message: "", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(accion)
                
                self.present(alert, animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "Registered successfully!", message: "Pleas Login!", preferredStyle: .alert)
                
                self.present(alert, animated: true, completion: nil)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.dismiss(animated: true, completion: nil)
                }
                self.dismiss(animated: true, completion: nil)
          }
      }
   }
    
    @objc func tableViewTapped() {
        
        view.endEditing(true)
    
    }

}
