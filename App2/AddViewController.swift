//
//  AddViewController.swift
//  App2
//
//  Created by user209640 on 3/10/22.
//

import UIKit
import CoreData

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    let categorias = ["Friends", "Family", "Work"]
    
    var seleccionado = ""
   
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
   
    @IBOutlet weak var pickerCategory: UIPickerView!
    @IBOutlet weak var txtBirthdate: UITextField!
    @IBOutlet weak var txtAdress: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorias.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorias[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccionado = categorias[row]
    }
    
   
    @IBAction func saveContact(_ sender: Any) {
        

        let managedObjectContext = CoreDataManager.shared.persistentContainer.viewContext
        let newContact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: managedObjectContext) as! Contact
        
        
        newContact.name = txtName.text
        newContact.lastname = txtLastname.text
        newContact.birthdate = txtBirthdate.text
        newContact.phone = txtPhone.text
        newContact.category = seleccionado
        newContact.adress = txtAdress.text
        newContact.image = "image"
        
        CoreDataManager.shared.saveContext()
        self.navigationController?.popToRootViewController(animated: true)
        }
           
    
    
}
