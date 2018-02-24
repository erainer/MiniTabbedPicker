//
//  SocialViewController.swift
//  miniTabbedApp
//
//  Created by Emily on 2/24/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
   
    @IBOutlet weak var socialPicker: UIPickerView!
    
    private let socialMedia = ["Facebook","Instagram", "LinkedIn", "Twitter"]
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    @IBAction func onLoginBtn(_ sender: UIButton) {
        if(username.text == "" || password.text == ""){
            let missing = "You are missing information!"
            let alert = UIAlertController(title: missing, message: "Try Again", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }else{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let welcome = storyBoard.instantiateViewController(withIdentifier: "welcome") as! WelcomeViewController
            self.present(welcome, animated:true, completion:nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return socialMedia.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return socialMedia[row]
    }

}
