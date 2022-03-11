//
//  ViewController.swift
//  App2
//
//  Created by Aracely Berrocal on 12/1/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var myTable: UITableView!
    
    let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
    var searchResult: Array<Contact> = []
    var manageObjectContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manageObjectContext = getContext()
    }
    
    private func getContext() -> NSManagedObjectContext{
        return CoreDataManager.shared.persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool) {
        do{
            searchResult = try getContext().fetch(fetchRequest)
        } catch let error as NSError {
            print("Error")
        }
        DispatchQueue.main.async {
            self.myTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell
        
        if searchResult.count  > 0{
            let name = searchResult[indexPath.row].name
            let lastname = searchResult[indexPath.row].lastname
            let phone = searchResult[indexPath.row].phone
            
            cell?.configure(name: name, lastname: lastname)
        }
        return cell!
    }
    
    

}


