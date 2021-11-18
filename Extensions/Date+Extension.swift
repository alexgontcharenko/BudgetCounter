//
//  Calendar+Extension.swift
//  BudgetCounter
//
//  Created by Steew on 18.11.2021.
//

import UIKit

extension Date {
    var weekdayName: String {
        let formatter = DateFormatter(); formatter.dateFormat = "E"
        return formatter.string(from: self as Date)
    }
}
