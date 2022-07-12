//
//  TaskCellViewModel.swift
//  Done
//
//  Created by Oğuz Karatoruk on 12.07.2022.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var task: Task
    
    var id = ""
    @Published var completionStateIconName = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task
            .map { task in
                task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)
        
        $task.map { task in
            task.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables )
    }
}
