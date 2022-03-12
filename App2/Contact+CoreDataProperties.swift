//
//  Contact+CoreDataProperties.swift
//  App2
//
//  Created by user209640 on 3/12/22.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var adress: String?
    @NSManaged public var birthdate: String?
    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var lastname: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?

}

extension Contact : Identifiable {

}
