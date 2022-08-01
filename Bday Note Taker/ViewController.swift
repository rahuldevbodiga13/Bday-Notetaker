//
//  ViewController.swift
//  Bday Note Taker
//
//  Created by Rahul Dev on 13/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userBday: UITextField!
    
    @IBOutlet weak var storedName: UILabel!
    
    @IBOutlet weak var storedDate: UILabel!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        storedName.text = UserDefaults.standard.object(forKey: "name") as? String
        storedDate.text = UserDefaults.standard.object(forKey: "bday") as? String
    }

    @IBAction func rememberFunc(_ sender: Any) {
        UserDefaults.standard.set(userName.text!, forKey: "name")
        UserDefaults.standard.set(userBday.text!, forKey: "bday")
        UserDefaults.standard.synchronize()
        storedName.text = userName.text!
        storedDate.text = userBday.text!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromFirstToSecondSegue" {
            let destVC = segue.destination as! SecondViewController
            destVC.name = name
        }
    }
    
    @IBAction func nextFunc(_ sender: Any) {
        name = userName.text!
        performSegue(withIdentifier: "fromFirstToSecondSegue", sender: nil)
    }
    
    @IBAction func deleteFunc(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "bday")
        UserDefaults.standard.synchronize()
        storedDate.text = ""
        storedName.text = ""
    }
    
    @IBAction func handleAlert(_ sender: Any) {
        performSegue(withIdentifier: "fromFirstToSignup", sender: nil)
    }
    
}
