//
//  ViewPersonInfoController.swift
//  UserLoginAndRegistration
//
//  Created by Yanwenli on 14/02/2019.
//  Copyright © 2019 Yanwenli_ios_TP. All rights reserved.
//

import UIKit

class ViewPersonInfoController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tablePerson: UITableView!
    
    var listPersonInfo : Array<Users> = []
    
//    var emailloggedin : String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        if (tablePerson != nil) {
            let db:Database = Database()
            db.initSQL()
            listPersonInfo = db.read();
            tablePerson.reloadData();
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (tablePerson != nil) {
            tablePerson.dataSource = self
            tablePerson.delegate = self
        }
        let db:Database = Database()
        
        db.initSQL()
        
        listPersonInfo = db.read();
        
        if (tablePerson != nil) {
            tablePerson.reloadData();
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPersonInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Récupérons le bon élément
        let user = listPersonInfo[indexPath.row]
        
        // Créons une cellule
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ElementCell")
        
        // On y ajoute les bonnes informations
        cell.textLabel?.text = String(user.userId)
        cell.detailTextLabel?.text = user.userEmail
        cell.detailTextLabel?.text = user.userTelephone
        cell.detailTextLabel?.text = user.userAddress
        cell.detailTextLabel?.text = user.userName
        cell.detailTextLabel?.text = user.userPassword

        // On retourne la cellule
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
