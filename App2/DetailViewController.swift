//
//  DetailViewController.swift
//  App2
//
//  Created by user209640 on 3/10/22.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLastname: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblBirthday: UILabel!
    @IBOutlet weak var lblAdress: UILabel!
    
    var contact: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            lblName.text = contact.value(forKey: "name") as! String?
            lblLastname.text = contact.value(forKey: "lastname") as! String?
            lblPhone.text = contact.value(forKey: "phone") as! String?
            lblCategory.text = contact.value(forKey: "category") as! String?
            lblBirthday.text = contact.value(forKey: "birthdate") as! String?
            lblAdress.text = contact.value(forKey: "adress") as! String?        }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            
            if segue.identifier == "update" {
                if let vistaEdit = segue.destination as? EditViewController {
                    vistaEdit.contact = self.contact
                }
            }
    }


   
}
