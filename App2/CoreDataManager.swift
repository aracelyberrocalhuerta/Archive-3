//
//  CoreDataManager.swift
//  App2
//
//  Created by user209640 on 3/10/22.
//

import Foundation
import CoreData

class CoreDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { storeDescripcion, Error in
            guard let error = Error else {return}
        }
        return container
}()
  
    
    func saveContext(){
        let context = persistentContainer.viewContext
        
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print("Error")
            }
        }
    }
    static let shared: CoreDataManager = {
        let instance = CoreDataManager()
        return instance
    }()

}
