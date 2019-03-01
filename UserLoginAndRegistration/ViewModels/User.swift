////
////  User.swift
////  UserLoginAndRegistration
////
////  Created by Yanwenli on 15/02/2019.
////  Copyright © 2019 Yanwenli_ios_TP. All rights reserved.
////
//
//
//import UIKit
//
//class User: NSObject, NSCoding {    //1
//
//
//    struct PropertyKey {
//        static let emailKey = "emailKey"
//        static let telephoneKey = "telephoneKey"
//        static let addressKey = "addressKey"
//        static let passwordKey = "passwordKey"
//        static let usernameKey = "usernameKey"
//    }
//
//    var userEmail: String?
//    var userTelephone: String?
//    var userAddress: String?
//    var userName: String?
//    var userPassword: String?
//    
//    
//    override init() {
//
//    }
//
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(userEmail, forKey: PropertyKey.emailKey)
//        aCoder.encode(userTelephone, forKey: PropertyKey.telephoneKey)
//        aCoder.encode(userAddress, forKey: PropertyKey.addressKey)
//        aCoder.encode(userPassword, forKey: PropertyKey.passwordKey)
//        aCoder.encode(userName, forKey: PropertyKey.usernameKey)
//
//    }
//
//    required init?(coder aDecoder: NSCoder) { // 3
//        userEmail = aDecoder.decodeObject(forKey: PropertyKey.emailKey) as? String
//        userTelephone = aDecoder.decodeObject(forKey: PropertyKey.telephoneKey) as? String
//        userAddress = aDecoder.decodeObject(forKey: PropertyKey.addressKey) as? String
//        userName = aDecoder.decodeObject(forKey: PropertyKey.usernameKey) as? String
//        userPassword = aDecoder.decodeObject(forKey: PropertyKey.passwordKey) as? String
//    }
//
//}
//
//
//extension UserDefaults {
//    func saveCustomObject(customObject object: NSCoding, key: String) {
//        let encodedObject = NSKeyedArchiver.archivedData(withRootObject: object)
//        self.set(encodedObject, forKey: key)
//        self.synchronize()
//    }
//
//    func getCustomObject(forKey key: String) -> AnyObject? {
//        let decodedObject = self.object(forKey: key) as? NSData
//
//        if let decoded = decodedObject {
//            let object = NSKeyedUnarchiver.unarchiveObjectWithData(decoded)
//            return object
//        }
//        
//        return nil
//    }
//}
