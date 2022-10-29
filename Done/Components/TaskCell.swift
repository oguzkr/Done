//
//  TaskCell.swift
//  Done
//
//  Created by Oğuz Karatoruk on 14.07.2022.
//

import SwiftUI

struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    
    var onCommit: (Task) -> (Void) = {_ in }
    @State private var askDelete = false

    var body: some View {
        HStack {
            TextField("Enter the task title", text: $taskCellVM.task.title) {
                self.onCommit(self.taskCellVM.task)
            }
            .strikethrough(self.taskCellVM.task.completed, pattern: .dash, color: .black)
            
            if taskCellVM.task.title != "" {
                TaskCellManageButtons(taskCellVM: self.taskCellVM)
            }
        }
    }
}



struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false)))
            .padding()
            .previewLayout(.fixed(width: 375, height: 50))
            .previewDisplayName("TaskCell Completed False&Empty")
        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "Task 123 Task 456", completed: false)))
            .padding()
            .previewLayout(.fixed(width: 375, height: 50))
            .previewDisplayName("TaskCell Completed False&Text")
        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "Task", completed: true)))
            .padding()
            .previewLayout(.fixed(width: 375, height: 50))
            .previewDisplayName("TaskCell Completed True&Text")
    }
}


extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
