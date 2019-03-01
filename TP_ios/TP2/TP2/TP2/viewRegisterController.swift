//
//  viewRegisterController.swift
//  TP2
//
//  Created by tp on 08/02/2019.
//  Copyright © 2019 tp. All rights reserved.
//

import UIKit

class viewRegisterController: UIViewController {

    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    @IBOutlet weak var userRepeatPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        let userEmail = userEmailText.text
        let userPassword = userPasswordText.text
        let userName = userNameText.text
        let userRepeatPassword = userRepeatPasswordText.text
        
        // Check for empty fields
        if(userEmail?.isEmpty ?? true || userPassword?.isEmpty ?? true || userName?.isEmpty ?? true || userRepeatPassword?.isEmpty ?? true){
            //display alert message
            displayMyAlertMessage(userMessage: "All fields aure required");
            return ;
        }

        //check if passwords macth
        if(userPassword != userRepeatPassword){
            //display alert message
            displayMyAlertMessage(userMessage: "Password do not match");
            return;
        }
        // Store data
        
        UserDefaults.standard.set(userEmail, forKey: "userEmail");
        UserDefaults.standard.set(userEmail, forKey: "userPassword");
        UserDefaults.standard.synchronize();

        // Display alert message with confirmation
        var myalert = UIAlertController(title:"Alert", message:"Registration is successful.", preferredStyle:UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default
        ){action in
            self.dismiss(animated: true, completion: nil);
        }
        

    }
    func displayMyAlertMessage(userMessage:String){
        var myalert = UIAlertController(title:"Alert", message:userMessage, preferredStyle:UIAlertController.Style.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default
            , handler: nil);
        
        myalert.addAction(okAction);
        
        self.present(myalert, animated:true, completion: nil);
            
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
