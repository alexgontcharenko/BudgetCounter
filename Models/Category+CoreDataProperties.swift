//
//  Category+CoreDataProperties.swift
//  
//
//  Created by Steew on 18.11.2021.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var details: String?
    @NSManaged public var name: String?

}
