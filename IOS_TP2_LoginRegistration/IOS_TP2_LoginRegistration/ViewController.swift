//
//  ViewController.swift
//  IOS_TP2_LoginRegistration
//
//  Created by Yanwenli on 14/02/2019.
//  Copyright © 2019 Yanwenli_ios_TP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let emailTextField: UITextField = {
        let e = UITextField()
        e.placeholder = "Email:"
        e.textColor = .white
        e.backgroundColor = GREEN_THEME
        
        return e
    
    }()
    
    let passwordTextField: UITextField = {
        let p = UITextField()
        p.placeholder = "Password:"
        p.textColor = .white
        p.backgroundColor = GREEN_THEME
        
        return p
        
    }()
    
    let loginButton: UIButton = {
        let l = UIButton(type: .system)
        l.setTitleColor(.white, for: .normal)
        l.setTitle("Log in ", for: .normal)
        l.backgroundColor = .purple
        
        return l
    }()
    
    let forgetPasswordButton: UIButton = {
        let f = UIButton(type: .system)
        f.setTitleColor(.white, for: .normal)
        f.setTitle("Forgot Password? ", for: .normal)
        f.backgroundColor = GREEN_THEME
        
        return f
        
    }()
    
    let haveAccountButton: UIButton = {
        let color = UIColor(red: 89 / 255, green: 156 / 255, blue: 120 / 255, alpha: 1 )
        let font = UIFont.systemFont(ofSize: 16)
        let h = UIButton(type: .system)
        let attributedTitle = NSAttributedString(string: "Don't have an account?", attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font ])
//        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font: font] ))
        
        h.setAttributedTitle(attributedTitle, for: .normal)
        h.setTitleColor(.white, for: .normal)
        h.setTitle("Log in ", for: .normal)
        h.backgroundColor = GREEN_THEME
        return h
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = GREEN_THEME
        setupTextFieldComponents()
        setupLoginButton()
        setHaveAccountButton()
        setForgotPassword()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
         return .lightContent
    }
    
  
    fileprivate func setupTextFieldComponents(){
        setupEmailField()
        setupPasswordField()

    }
    
    fileprivate func setupEmailField(){
        view.addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor,  constant: 24).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor,  constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
    }
    
    fileprivate func setupPasswordField(){
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,  constant: 8).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor,  constant: 0).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor,  constant: 0 ).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    fileprivate func setupLoginButton(){
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8).isActive = true
        loginButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor,  constant: 0 ).isActive = true
        loginButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor,  constant: 0 ).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }


    fileprivate func setHaveAccountButton(){
        view.addSubview(haveAccountButton)
        haveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        haveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        haveAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor,  constant: 12).isActive = true
        haveAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor,  constant: -12 ).isActive = true
        haveAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    fileprivate func setForgotPassword(){
        view.addSubview(forgetPasswordButton)
        forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgetPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 0).isActive = true
        forgetPasswordButton.leftAnchor.constraint(equalTo: view.leftAnchor,  constant: 12).isActive = true
        forgetPasswordButton.rightAnchor.constraint(equalTo: view.rightAnchor,  constant: -12 ).isActive = true
        forgetPasswordButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

}

