//
//  Todo.swift
//  Todo List
//
//  Created by Mohammed on 29/10/2024.
//

import Foundation
import SwiftData

@Model
class Todo: Identifiable {
    var id: String = ""
    var title: String = ""
    
    
    // 0 means Optional
    // 1 means Important
    // 2 means Urgent
    var typeOfTask = 0
    var isCompleted = false
    var date: Date = Date()
    
    init(){
        id = UUID().uuidString
        date = Date.now
    }
}

extension Bool: @retroactive Comparable {
    public static func <(lhs: Self, rhs: Self) -> Bool {
        // the only true inequality is false < true
        !lhs && rhs
    }
}
