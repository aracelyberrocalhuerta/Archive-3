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
        let container = NSPersistentContainer(name: "MiModeloCoreData")
        container.loadPersistentStores { (storeDescription, error ) in guard let error = error else {return}
            if let error = error as NSError?{
                fatalError()
            }
    }
        return container
}()
    static let shared: CoreDataManager = {
        let instance = CoreDataManager()
        return instance
    }()
    
    func saveContext(){
        let context = persistentContainer.viewContext
        
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                let error = error as NSError
                print("Error")
            }
        }
    }

}
