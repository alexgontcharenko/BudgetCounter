//
//  Transaction+CoreDataProperties.swift
//  
//
//  Created by Steew on 18.11.2021.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var amount: Int16
    @NSManaged public var category: String?
    @NSManaged public var date: String?
    @NSManaged public var note: String?
    @NSManaged public var recipient: String?
    @NSManaged public var account: Account?

}
