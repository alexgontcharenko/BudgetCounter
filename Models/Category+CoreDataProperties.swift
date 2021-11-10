//
//  Category+CoreDataProperties.swift
//  BudgetCounter
//
//  Created by Steew on 07.11.2021.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var details: String?

}

extension Category : Identifiable {

}
