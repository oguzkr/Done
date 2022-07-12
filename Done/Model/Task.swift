//
//  Task.swift
//  Done
//
//  Created by Oğuz Karatoruk on 12.07.2022.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG
let testDataTasks = [
    Task(title: "Deneme 1", completed: true),
    Task(title: "Deneme 2", completed: false),
    Task(title: "Deneme 3", completed: false),
    Task(title: "Deneme 4", completed: true),
    Task(title: "Deneme 5", completed: false)
]
#endif

