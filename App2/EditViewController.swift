//
//  EditViewController.swift
//  App2
//
//  Created by user209640 on 3/12/22.
//

import UIKit
import CoreData

class EditViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    
    @IBOutlet weak var txtAdress: UITextField!
    @IBOutlet weak var txtBirthdate: UITextField!
    
    var contact: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        txtName.text = contact.value(forKey: "name") as! String?
        txtLastname.text = contact.value(forKey: "lastname") as! String?
        txtBirthdate.text = contact.value(forKey: "birthdate") as! String?
        txtAdress.text = contact.value(forKey: "adress") as! String?
        phone.text = contact.value(forKey: "phone") as! String?
        txtCategory.text = contact.value(forKey: "category") as! String?
    }
    

    @IBAction func save(_ sender: Any) {
        contact.setValue(txtName.text, forKey: "name")
        contact.setValue(txtLastname.text, forKey: "lastname")
        contact.setValue(txtBirthdate.text, forKey: "birthdate")
        contact.setValue(phone.text, forKey: "phone")
        contact.setValue(txtAdress.text, forKey: "address")
        contact.setValue(txtCategory.text, forKey: "category")
        CoreDataManager.shared.saveContext()
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
