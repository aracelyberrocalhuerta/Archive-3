//
//  AddViewController.swift
//  App2
//
//  Created by user209640 on 3/10/22.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    var contact: NSManagedObject!
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtBirthdate: UITextField!
    @IBOutlet weak var txtAdress: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    }
    
   
    @IBAction func saveContact(_ sender: Any) {
        

        let managedObjectContext = CoreDataManager.shared.persistentContainer.viewContext
        let newContact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: managedObjectContext) as! Contact
        
        
        newContact.name = txtName.text
        newContact.lastname = txtLastname.text
        newContact.birthdate = txtBirthdate.text
        newContact.phone = txtPhone.text
        newContact.category = txtCategory.text
        newContact.adress = txtAdress.text
        newContact.image = "image"
        
        CoreDataManager.shared.saveContext()
        self.navigationController?.popToRootViewController(animated: true)
        }
           
    
    
}
