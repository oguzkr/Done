//
//  AddTaskPopUp.swift
//  Done
//
//  Created by Oğuz Karatoruk on 30.10.2022.
//

import SwiftUI

struct AddTaskPopUp: View {
    @Environment (\.presentationMode) var presentationMode
    @FocusState private var keyboardFocused: Bool
    @ObservedObject var taskListVM = TaskListViewModel()

    @State var taskText: String
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    //TODO: CLOSE POPUP
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("cancel")
                        .foregroundColor(Color.blue)
                        .frame(width: 80)
                    
                    
                })
                
                .padding(10)
                .background(Color.white)
                .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.blue, lineWidth: 1)
                )
                Spacer(minLength: 10)
                Button(action: {
                    self.taskListVM.addTask(task: Task(title: self.taskText, completed: false))
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("add")
                        .foregroundColor(Color.white)
                })
                .frame(width: 80)
                .padding(10)
                .background(Color.blue)
                .cornerRadius(5)
            }
            Spacer(minLength: 20)
            TextEditor(text: $taskText)
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .padding(EdgeInsets(top:10, leading:10, bottom: 10, trailing: 30))
                .scrollContentBackground(.hidden)
                .background(Color("textBackground"))
                .cornerRadius(10)
                .focused($keyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            keyboardFocused = true
                        }
                    }
        }
        .padding(25)
    }
}

struct AddTaskPopUp_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskPopUp(taskText: "Task skajfkasjf")
            .padding()
            .previewDisplayName("Add task cell")
    }
}
