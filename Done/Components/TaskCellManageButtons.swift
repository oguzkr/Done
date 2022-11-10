//
//  TaskCellManageButtons.swift
//  Done
//
//  Created by Oğuz Karatoruk on 29.10.2022.
//

import SwiftUI

struct TaskCellManageButtons: View {
    var taskCellVM: TaskCellViewModel
    @State private var askDelete = false

    var body: some View {
        HStack {
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "checkmark.circle")
                .foregroundColor(taskCellVM.task.color == "defaultTaskColor" ? Color("textColor") : .white)
                .frame(width: 50, height: 50)
                .onTapGesture {
                self.taskCellVM.task.completed.toggle()
            }
            
            Image(systemName: "trash")
                .foregroundColor(taskCellVM.task.color == "defaultTaskColor" ? Color("textColor") : .white)
                .frame(width: 50, height: 50)
                .onTapGesture {
                self.askDelete.toggle()
                }
                .alert("Are you sure you want to delete this task?", isPresented: self.$askDelete) {
                    Button("Yes") {
                        self.taskCellVM.taskRepository.deleteTask(self.taskCellVM.task)
                    }
                    Button("No", role: .cancel) { }
                }


        }
    }
}

struct TaskCellManageButtons_Previews: PreviewProvider {
    static var previews: some View {
        TaskCellManageButtons(taskCellVM: TaskCellViewModel(task: Task(title: "Task", completed: true)))
            .padding()
            .previewLayout(.fixed(width: 375, height: 50))
            .previewDisplayName("TaskCell Completed True&Text")
    }
}
