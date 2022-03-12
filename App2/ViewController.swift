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
    
    let fetchRequest: NSFetchRequest = Contact.fetchRequest()
    var searchResult: Array<Contact> = []
    var manageObjectContext: NSManagedObjectContext?
    
    let cellReuseIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        
        myTable.delegate = self
        myTable.dataSource = self
        DispatchQueue.main.async  {
            self.myTable.reloadData()
        }
    }
    
    private func getContext() -> NSManagedObjectContext{
        return CoreDataManager.shared.persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool) {
        do{
            searchResult = try getContext().fetch(fetchRequest)
        } catch{
            print("Error")
        }
        DispatchQueue.main.async {
            self.myTable.reloadData()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(searchResult)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell
        
        if searchResult.count  > 0{
            let name = searchResult[indexPath.row].name
            let lastname = searchResult[indexPath.row].lastname
        
            
            cell?.configure(name: name, lastname: lastname)
        }
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            guard let indexPath = self.myTable.indexPathForSelectedRow else {
return
        }
            let selectedItem: NSManagedObject = searchResult[indexPath.row] as NSManagedObject
            if let vistaDetalle = segue.destination as? DetailViewController {
                vistaDetalle.contact = selectedItem
            }
    }

}

}
