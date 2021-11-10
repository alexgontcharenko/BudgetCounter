//
//  Transaction+CoreDataProperties.swift
//  BudgetCounter
//
//  Created by Steew on 07.11.2021.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var date: Int16
    @NSManaged public var amount: Int16
    @NSManaged public var recipient: String?
    @NSManaged public var category: String?
    @NSManaged public var note: String?
    @NSManaged public var account: Account?

}

extension Transaction : Identifiable {

}
