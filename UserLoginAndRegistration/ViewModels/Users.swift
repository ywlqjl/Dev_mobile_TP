//
//  Users.swift
//  UserLoginAndRegistration
//
//  Created by Yanwenli on 15/02/2019.
//  Copyright © 2019 Yanwenli_ios_TP. All rights reserved.
//

import UIKit
class Users: NSObject{
        var userId: Int
        var userEmail: String
        var userTelephone: String
        var userAddress: String
        var userName: String
        var userPassword: String
    
    init(userId:Int, userEmail:String, userTelephone:String, userAddress: String, userName: String,userPassword: String){
        self.userId = userId
        self.userEmail = userEmail
        self.userTelephone = userTelephone
        self.userAddress = userAddress
        self.userName = userName
        self.userPassword = userPassword
    }
}
