//
//  TaskCell.swift
//  Done
//
//  Created by Oğuz Karatoruk on 14.07.2022.
//

import SwiftUI

struct TaskCell: View {
    
    @ObservedObject var taskCellVM: TaskCellViewModel
    @State var presentAddNewItem = false
    var onCommit: (Task) -> (Void) = {_ in }
    @State private var askDelete = false

    var body: some View {
        HStack {
            Text(taskCellVM.task.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .foregroundColor(self.taskCellVM.task.color == "defaultTaskColor" ? Color("textColor") : .white)
//                .tint()
                .strikethrough(self.taskCellVM.task.completed, pattern: .solid, color: self.taskCellVM.task.color == "defaultTaskColor" ? Color("textColor") : .white)
                .contentShape(Rectangle())
                .sheet(isPresented: $presentAddNewItem) {
                    AddTaskView(
                        selectedColor: taskCellVM.task.color ?? "defaultTaskColor",
                        taskText: taskCellVM.task.title,
                        taskToEdit: taskCellVM.task)
                }
                .onTapGesture {
                    self.presentAddNewItem.toggle()
                }
            Spacer()
            Divider()
        TaskCellManageButtons(taskCellVM: self.taskCellVM)
        }
        
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
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


//extension View {
//    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
//        switch shouldHide {
//        case true: self.hidden()
//        case false: self
//        }
//    }
//}
