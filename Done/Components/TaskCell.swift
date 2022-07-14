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
    
    var body: some View {
        HStack {
            TextField("Enter the task title", text: $taskCellVM.task.title) {
                self.onCommit(self.taskCellVM.task)
            }
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "checkmark.circle")
                .renderingMode(.template)
                .foregroundColor(Color("appBlue"))
                .frame(width: 20, height: 20)
               
                .onTapGesture {
                    self.taskCellVM.task.completed.toggle()
                }
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false)))
            .padding()
            .previewLayout(.fixed(width: 375, height: 50))
            .previewDisplayName("TaskCell")
        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "Task 123 Task 456", completed: false)))
            .padding()
            .previewLayout(.fixed(width: 375, height: 50))
            .previewDisplayName("TaskCell")
        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "Task", completed: true)))
            .padding()
            .previewLayout(.fixed(width: 375, height: 50))
            .previewDisplayName("TaskCell")
    }
}


