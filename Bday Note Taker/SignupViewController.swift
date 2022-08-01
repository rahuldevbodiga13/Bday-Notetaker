//
//  SignupViewController.swift
//  Bday Note Taker
//
//  Created by Rahul Dev on 15/07/22.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
    
    @IBAction func handleSignup(_ sender: Any) {
        
        if !(userName.text!.isEmpty) {
        
            if !(password.text!.isEmpty) {
                
                if !(confirmPassword.text!.isEmpty){
                    
                    if confirmPassword.text!.isEqual(password.text!) {
                        showAlert(isErr: false, msg: "User registered Successfully")
                    } else {
                        showAlert(isErr: true,msg: "Password doesn't match")
                    }
                    
                } else {
                    showAlert(isErr: true,msg: "Please Enter Password")
                }
            } else {
                showAlert(isErr: true,msg: "Please Enter Password")
            }
            
        } else {
            showAlert(isErr: true,msg: "Please Enter User Name")
        }
        
    }
    
    func showAlert(isErr: Bool, msg: String) {
        var header = ""
        if isErr {
            header = "Error"
        } else {
            header = "Success"
        }
        
        let alert = UIAlertController(title: header, message: msg, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        let deleteButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: nil)
        alert.addAction(okButton)
        alert.addAction(deleteButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
