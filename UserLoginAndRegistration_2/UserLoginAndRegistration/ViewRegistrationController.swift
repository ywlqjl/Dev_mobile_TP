//
//  ViewRegistrationController.swift
//  UserLoginAndRegistration
//
//  Created by Yanwenli on 14/02/2019.
//  Copyright © 2019 Yanwenli_ios_TP. All rights reserved.
//

import UIKit

class ViewRegistrationController: UIViewController {

    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    @IBOutlet weak var userRepeatPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        userPasswordText.passwordRules = UITextInputPasswordRules(descriptor: "required: upper; required: lower; required: digit; max-consecutive: 2; minlength: 8;")
//        userPasswordText.textContentType = .newPassword
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userEmail = userEmailText.text
        let userPassword = userPasswordText.text
        let userRepeatPassword = userRepeatPasswordText.text
        
        // Check for empty fields
        if(userEmail?.isEmpty ?? true || userPassword?.isEmpty ?? true || userRepeatPassword?.isEmpty ?? true){
            //display alert message
            displayMyAlertMessage(userMessage: "All fields aure required");
            return ;
        }
        if(userPassword?.isPasswordValid)!{
//            displayMyAlertMessage(userMessage: "Your password is valid");
            //check if passwords macth
            if(userPassword != userRepeatPassword){
                //display alert message
                displayMyAlertMessage(userMessage: "Password do not match");
                return;
            }
            
            // Store data
            UserDefaults.standard.set(userEmail, forKey: "userEmail");
            UserDefaults.standard.set(userPassword, forKey: "userPassword");
            UserDefaults.standard.synchronize();
            
            // Display alert message with confirmation
            var myAlert = UIAlertController(title:"Alert", message:"Registration is successful.", preferredStyle:UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default
            ){action in
                self.dismiss(animated: true, completion: nil);
            }
            
            myAlert.addAction(okAction);
            self.present(myAlert, animated:true, completion: nil);

        }
        else{
            displayMyAlertMessage(userMessage: "Your password isn't valid");
        }
        
        
    }
    
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle:UIAlertController.Style.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default
            , handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true, completion: nil);
        
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension String{
    var isPasswordValid: Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with:self)
    }
}
