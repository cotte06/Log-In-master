//
//  ResetPasswordViewController.swift
//  Prueba
//
//  Created by maria jose acosta palma on 29-09-20.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    
    
    @IBOutlet var emailAddressTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        
        view.addGestureRecognizer(tapGesture)
        
    }

    @IBAction func resetPasswordButtonPressed(_ sender: UIButton) {
    
        Auth.auth().sendPasswordReset(withEmail: emailAddressTextfield.text!) { (error) in
            
            if error != nil{
                let alert = UIAlertController(title: "Invalid email address.", message: "Try again!", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(accion)
                
                self.present(alert, animated: true, completion: nil)
            }
            else {
                
                let alert = UIAlertController(title: "We have sent you a new password to your email!", message: "", preferredStyle: .alert)
                                
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
