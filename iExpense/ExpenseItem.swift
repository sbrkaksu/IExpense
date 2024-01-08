//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Berk Aksu on 8.01.2024.
//

import Foundation

//Since ExpenseItem inherits Identifiable, we did ensure that each struct will be unique, that's why there is no need to use \.id with foreach.
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
