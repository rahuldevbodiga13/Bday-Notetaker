//
//  SecondViewController.swift
//  Bday Note Taker
//
//  Created by Rahul Dev on 15/07/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var imgLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var name = ""
    var toggle = 0
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = name
        
        imgView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.handleImageTap))
        
        imgView.addGestureRecognizer(gestureRecognizer)
        counter = 10
      
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SecondViewController.handleTimer), userInfo: nil, repeats: true)
    }
    
    @objc func handleTimer(){
        
        timeLabel.text = String(counter)
        counter-=1
        
        if counter == 0 {
            timer.invalidate()
            timeLabel.text = "Done aMIGOO"
        }
        
    }
    
    @objc func handleImageTap() {
        if toggle == 0 {
            imgView.image = UIImage(named: "avengers.jpg")
            imgLabel.text = "Civil War"
            toggle=1
        } else {
            imgView.image = UIImage(named: "marvels.jpg")
            imgLabel.text = "Avengers Assemble!"
            toggle = 0
        }
        
    }

    @IBAction func handleBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeImg(_ sender: Any) {
       handleImageTap()
    }
    
}
