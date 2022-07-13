//
//  Task.swift
//  Done
//
//  Created by Oğuz Karatoruk on 12.07.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
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

