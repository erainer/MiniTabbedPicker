//
//  LoginViewController.swift
//  miniTabbedApp
//
//  Created by Emily on 2/21/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let URL_SAVE_USER = "http://emily.nextnely.com/api/createUser.php"
    
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onLoginBtn(_ sender: UIButton) {
            //created NSURL
            let requestURL = NSURL(string:URL_SAVE_USER)
        
            //creating NSMutableURLRequest
            let request = NSMutableURLRequest(url: requestURL! as URL)
        
            //setting the method to post
            request.httpMethod = "POST"
        
            //getting values from text fields
            let userID = usernameOutlet.text
            let userPassword = passwordOutlet.text
        
            //creating the post parameter by concatenation the keys and values from text fields
        let postParameters = "username="+userID!+"&password="+userPassword!;
        
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
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
