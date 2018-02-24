//
//  CreateViewController.swift
//  miniTabbedApp
//
//  Created by Emily on 2/23/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
   
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rePassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        birthdayPicker.setDate(date as Date, animated: false)

    }
    @IBAction func onCreateBtn(_ sender: UIButton) {
        if(username.text == "" || password.text == "" || rePassword.text == ""){
            let missing = "You are missing information!"
            let alert = UIAlertController(title: missing, message: "Try Again", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        else if(password.text != rePassword.text){
            let title = "Your password doesn't match!"
            let alert = UIAlertController(title: title, message: "Try Again", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        else{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let welcome = storyBoard.instantiateViewController(withIdentifier: "welcome") as! WelcomeViewController
            self.present(welcome, animated:true, completion:nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

}
