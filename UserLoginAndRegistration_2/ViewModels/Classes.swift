//
//  Classes.swift
//  UserLoginAndRegistration
//
//  Created by Yanwenli on 15/02/2019.
//  Copyright © 2019 Yanwenli_ios_TP. All rights reserved.
//

import UIKit

//struct Person {
//    var firstName: String
//    var secondName: String? // optional value
//    var salary: Int
//
//    // default designed init - 默认的指定初始化方法
//    init() {
//        firstName = "flion"
//        salary = 100
//    }
//
//    // 带参数的指定初始化
//    init(firstName: String, secondName: String?, salary: Int) {
//        self.firstName = firstName
//        self.secondName = secondName
//        self.salary = salary
//    }
//
//
//    func eat(foodName: String) -> Void {
//        print("eat food " + foodName)
//    }
//
//
//    func fullName() -> String {
//        if let tempSecondName = secondName {
//            return firstName + "-" + tempSecondName
//        } else {
//            return firstName
//        }
//    }
//}
//
//let flion = Person(firstName: "flion", secondName: "dep", salary: 100)
//print(flion.fullName())

class Person {
    
    var username: String
    var telephone: Int
    var address: String
    var email: String
    var password: String
    
    init?(email: String, password: String, username: String, telephone: Int, address: String) {
        self.email = email
        self.password = password
        self.username = username
        self.address = address
        self.telephone = telephone
        
        if email.isEmpty || password.isEmpty {
            return nil
        }
    }
    
    //getters
    func getName() -> String {
        return "Your username is \(username)"
    }

    func getUserName()->String{
        return self.username
    }
    
    func getAddress()->String{
        return self.address
    }
    
    func getTelephone()->Int{
        return self.telephone
    }
    
    func getEmail()->String{
        return self.email
    }
    
    func getPassword() -> String {
        return self.password
    }
    
    // setters
    func setUserName(username:String){
        self.username = username
    }
    func setAddress(address:String){
        self.address = address
    }
    func setTelephone(telephone:Int){
        self.telephone = telephone
    }
    func setPassword(password: String){
        self.password = password
    }
    //On modifie pas Email (comme id)
}
//var person2 = Person(name: "Steve", age: 56)
//person1.getName()
