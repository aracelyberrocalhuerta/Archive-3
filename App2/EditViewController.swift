//
//  EditViewController.swift
//  App2
//
//  Created by user209640 on 3/12/22.
//

import UIKit
import CoreData

class EditViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let categorias = ["Friends", "Family", "Work"]
    var seleccionado = ""
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    
    @IBOutlet weak var txtAdress: UITextField!
    @IBOutlet weak var txtBirthdate: UITextField!
    
    @IBOutlet weak var pickerCategory: UIPickerView!
    var contact: NSManagedObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        txtName.text = contact.value(forKey: "name") as! String?
        txtLastname.text = contact.value(forKey: "lastname") as! String?
        txtBirthdate.text = contact.value(forKey: "birthdate") as! String?
        txtAdress.text = contact.value(forKey: "adress") as! String?
        phone.text = contact.value(forKey: "phone") as! String?
        
        var number = 0
        if contact.value(forKey: "category") as! String? == "Friends" {
             number = 0
        }
        if contact.value(forKey: "category") as! String? == "Family" {
            number = 1
        }
        if contact.value(forKey: "category") as! String? == "Work" {
            number = 2
        }
            
        self.pickerCategory.selectRow(number, inComponent: 0, animated: true)
       
        
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

    @IBAction func save(_ sender: Any) {
        contact.setValue(txtName.text, forKey: "name")
        contact.setValue(txtLastname.text, forKey: "lastname")
        contact.setValue(txtBirthdate.text, forKey: "birthdate")
        contact.setValue(phone.text, forKey: "phone")
        contact.setValue(txtAdress.text, forKey: "adress")
        contact.setValue(seleccionado, forKey: "category")
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
