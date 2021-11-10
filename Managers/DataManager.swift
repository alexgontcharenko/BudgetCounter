//
//  DataManager.swift
//  BudgetCounter
//
//  Created by Steew on 10.11.2021.
//

import UIKit
import CoreData

class DataManager {
    static let shared = DataManager()
    private init() {}
    private var appDelegate: AppDelegate =
      UIApplication.shared.delegate as! AppDelegate
    
    func createPrefilledData() {
        addAccount(name: "Cash")
        addAccount(name: "Credit Card")
        addAccount(name: "Bank Account")
        addCategory(name: "Wages")
        addCategory(name: "Dividends")
        addCategory(name: "Taxes")
        addCategory(name: "Grocery")
        addCategory(name: "Entertainment")
        addCategory(name: "Gym")
        addCategory(name: "Health")
    }
    
    private func addAccount(name: String) {
        let account = Account(
            entity: Account.entity(), insertInto: appDelegate.persistentContainer.viewContext
        )
        account.currency = "USD"
        account.name = "\(name)"
        appDelegate.saveContext()
    }
    
    private func addCategory(name: String) {
        let category = Category(
            entity: Category.entity(), insertInto: appDelegate.persistentContainer.viewContext
        )
        category.name = "\(name)"
        appDelegate.saveContext()
    }
}
