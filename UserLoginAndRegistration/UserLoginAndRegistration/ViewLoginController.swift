//
//  ViewLoginController.swift
//  UserLoginAndRegistration
//
//  Created by Yanwenli on 14/02/2019.
//  Copyright © 2019 Yanwenli_ios_TP. All rights reserved.
//

import UIKit

class ViewLoginController: UIViewController {

    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        let userEmail = userEmailText.text!;
        let userPassword = userPasswordText.text!;

        var userEmailStored = ""
        var userPasswordStored = ""
        
        if(userEmail.isEmpty || userPassword.isEmpty){
            displayMyAlertMessage(userMessage: "All field should be filled!")
        }else{
            let db:Database = Database()
            db.initSQL()
     
            userPasswordStored = db.ifRegistered(userEmail: userEmail)
            if(!userPasswordStored.isEmpty){
                userEmailStored = userEmail
            }
        }
        

        
        
//        UserDefaults.standard.set(userEmail, forKey: "userEmail");
//        UserDefaults.standard.set(userEmail, forKey: "userPassword");
//        UserDefaults.standard.synchronize();
        
        if(userEmailStored == userEmail){
            if(userPasswordStored == userPassword){
                //Login is successfull
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn");
                UserDefaults.standard.synchronize();
                
                let sb = UIStoryboard(name: "Main", bundle:nil)
                let vc = sb.instantiateViewController(withIdentifier: "PersonInfoView") as! ViewPersonInfoController
//                vc.emailloggedin = userEmail!
                self.present(vc, animated: true, completion: nil)
//                self.dismiss(animated: true, completion: nil)
                
            }
        }
    //
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle:UIAlertController.Style.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default
            , handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true, completion: nil);
        
    }
}

