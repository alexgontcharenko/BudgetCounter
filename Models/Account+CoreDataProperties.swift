//
//  Account+CoreDataProperties.swift
//  BudgetCounter
//
//  Created by Steew on 07.11.2021.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var currency: String?
    @NSManaged public var name: String?

}

extension Account : Identifiable {

}

