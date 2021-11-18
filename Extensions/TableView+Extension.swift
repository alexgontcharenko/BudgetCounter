//
//  File.swift
//  BudgetCounter
//
//  Created by Steew on 18.11.2021.
//

import UIKit

extension UITableView {
     var dataHasChanged: Bool {
        guard let dataSource = dataSource else { return false }
        let sections = dataSource.numberOfSections?(in: self) ?? 0
        if numberOfSections != sections { return true }

        for section in 0..<sections {
            if numberOfRows(inSection: section) != dataSource.tableView(self, numberOfRowsInSection: section) {
                return true
            }
        }

        return false
     }
}
