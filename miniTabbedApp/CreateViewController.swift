//
//  CreateViewController.swift
//  miniTabbedApp
//
//  Created by Emily on 2/23/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
   let URL_SAVE_USER = "http://emily.nextnely.com/api/createUser.php"
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var rePass: UITextField!
    @IBOutlet weak var firstN: UITextField!
    @IBOutlet weak var lastN: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var birthday: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        birthday.setDate(date as Date, animated: false)

    }
    
    @IBAction func onCreateBtn(_ sender: UIButton) {
        
        //created NSURL
        let requestURL = NSURL(string:URL_SAVE_USER)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //getting values from text fields
        let username = id.text
        let password = pass.text
        let firstName = firstN.text
        let lastName = lastN.text
        let email = emailAddress.text
        //let birthdate = String(describing: self.birthday)
        
        //creating the post parameter by concatenation the keys and values from text fields
        let postParameters = "username="+username!+"&password="+password!+"&firstName="+firstName!+"&lastName="+lastName!+"&email="+email!
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if(error != nil){
                print("error is \(String(describing: error)))")
                return;
            }
            
            //parsing the json
            do{
                //converting response to NSDictionary
                let myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //parsing the json
                if let parseJSON = myJSON {
                    //creating a string
                    var msg: String!
                    msg = parseJSON["message"] as! String?
                    print(msg)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        
        
        
//        if(username.text == "" || password.text == "" || rePassword.text == ""){
//            let missing = "You are missing information!"
//            let alert = UIAlertController(title: missing, message: "Try Again", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
//            alert.addAction(action)
//            present(alert, animated: true, completion: nil)
//        }
//        else if(password.text != rePassword.text){
//            let title = "Your password doesn't match!"
//            let alert = UIAlertController(title: title, message: "Try Again", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
//            alert.addAction(action)
//            present(alert, animated: true, completion: nil)
//        }
//        else{
//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//            let welcome = storyBoard.instantiateViewController(withIdentifier: "welcome") as! WelcomeViewController
//            self.present(welcome, animated:true, completion:nil)
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

}
