//
//  Database.swift
//  UserLoginAndRegistration
//
//  Created by Yanwenli on 15/02/2019.
//  Copyright © 2019 Yanwenli_ios_TP. All rights reserved.
//

import UIKit
import SQLite3

class Database: NSObject {
    
    var db: OpaquePointer?
    
    func initSQL(){
        
        //the database file
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("catalog.sqlite")
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        //creating table
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Users (userId INTEGER PRIMARY KEY AUTOINCREMENT, userEmail TEXT, userTelephone TEXT, userAddress TEXT,userName TEXT, userPassword TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
    }
    
    func add(userEmail: String, userTelephone: String,userAddress: String,userName: String,userPassword: String) {
        
        //creating a statement
        var stmt: OpaquePointer?
        
        //the insert query
        let queryString = "INSERT INTO Users (userEmail, userTelephone,userAddress,userName,userPassword) VALUES (?,?,?,?,?)"
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, userEmail, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding userEmail: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, userTelephone, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding userTelephone: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 3, userAddress, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding userAddress: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 4, userName, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding userName: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 5, userPassword, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding userPassword: \(errmsg)")
            return
        }
//
//        if sqlite3_bind_int(stmt, 2, Int32(year)) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("failure binding model: \(errmsg)")
//            return
//        }
        
        //executing the query to insert values
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting users: \(errmsg)")
            return
        }
        
        //displaying a success message
        print("Add sucess")
    }
    
    func read() -> Array<Users>{
        //this is our select query
        let queryString = "SELECT * FROM Users"
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
        }
        
        var listUsers = [Users]()
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let userId = sqlite3_column_int(stmt, 0)
            let userEmail = String(cString: sqlite3_column_text(stmt, 1))
            let userTelephone = String(cString: sqlite3_column_text(stmt, 2))
            let userAddress = String(cString: sqlite3_column_text(stmt, 3))
            let userName = String(cString: sqlite3_column_text(stmt, 4))
            let userPassword = String(cString: sqlite3_column_text(stmt, 5))
            
//            let year = sqlite3_column_int(stmt, 2)
            
            //adding values to list
            let user = Users(userId:Int(userId),userEmail:userEmail, userTelephone:userTelephone,userAddress:userAddress,  userName:userName, userPassword:userPassword);
            listUsers.append(user);
        }
        
        return listUsers
    }
    
    func readPersonInfo(userEmail:String) -> Array<Users>{
        //this is our select query
        let queryString = "SELECT * FROM Users WHERE userEmail = "+userEmail
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing readPersonInfo: \(errmsg)")
        }
        
        var listPersonInfo = [Users]()
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let userId = sqlite3_column_int(stmt, 0)
            let userEmail = String(cString: sqlite3_column_text(stmt, 1))
            let userTelephone = String(cString: sqlite3_column_text(stmt, 2))
            let userAddress = String(cString: sqlite3_column_text(stmt, 3))
            let userName = String(cString: sqlite3_column_text(stmt, 4))
            let userPassword = String(cString: sqlite3_column_text(stmt, 5))
            
            //adding values to list
            let user = Users(userId:Int(userId),userEmail:userEmail, userTelephone:userTelephone,userAddress:userAddress,  userName:userName, userPassword:userPassword);
            listPersonInfo.append(user);
        }
        
        return listPersonInfo
    }
    
    //fonction pour vérifier si l'utilisateur est bien registré
    func ifRegistered(userEmail: String)-> String{
        
        let queryString = "SELECT * FROM Users WHERE userEmail = '"+userEmail+"'"
        var stmt:OpaquePointer?
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing readPersonInfo: \(errmsg)")
        }
        
        var listPersonInfo2 = [Users]()
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let userId = sqlite3_column_int(stmt, 0)
            let userEmail = String(cString: sqlite3_column_text(stmt, 1))
            let userTelephone = String(cString: sqlite3_column_text(stmt, 2))
            let userAddress = String(cString: sqlite3_column_text(stmt, 3))
            let userName = String(cString: sqlite3_column_text(stmt, 4))
            let userPassword = String(cString: sqlite3_column_text(stmt, 5))
            
            //adding values to list
            let user = Users(userId:Int(userId),userEmail:userEmail, userTelephone:userTelephone,userAddress:userAddress,  userName:userName, userPassword:userPassword);
            listPersonInfo2.append(user);
        }
        if(listPersonInfo2.isEmpty){
            return ""
        }
        
        return (listPersonInfo2.first?.userPassword)!
    }
    
    
}
