//
//  SharedData.swift
//  Done
//
//  Created by Oguz Personal on 5.11.2022.
//

import Foundation

struct SharedUserDefaults {
    static let suiteName = "group.com.oguzkr.DoneApp"
    
    struct Keys {
        static let tasks = "tasks"
    }
    
    struct Task:Codable, Identifiable{
        var id: String?
        var title: String
        var completed: Bool
        var color: String?
    }
}
