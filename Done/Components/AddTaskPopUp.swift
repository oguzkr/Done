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
    var taskColors = [Color("defaultTaskColor"), Color.red, Color.green, Color.blue]
    @State var selectedColor = Color("defaultTaskColor")
    @State var taskText: String
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(selectedColor == Color("defaultTaskColor") ? .blue : selectedColor)
                        .animation(.easeInOut)
                        .frame(width: 80)
                })
                
                .padding(10)
                .background(Color.white)
                .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(selectedColor == Color("defaultTaskColor") ? .blue : selectedColor, lineWidth: 1)
                            .animation(.easeInOut)
                )
                Spacer(minLength: 10)
                Button(action: {
                    self.taskListVM.addTask(task: Task(title: self.taskText, completed: false, color: selectedColor.description))
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Add")
                        .foregroundColor(Color.white)
                })
                .frame(width: 80)
                .padding(10)
                .background(selectedColor == Color("defaultTaskColor") ? .blue : selectedColor)
                .animation(.easeInOut)
                .cornerRadius(5)
            }
            Spacer(minLength: 20)
            TextEditor(text: $taskText)
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .padding(EdgeInsets(top:10, leading:10, bottom: 10, trailing: 30))
                .scrollContentBackground(.hidden)
                .background(selectedColor)
                .animation(.easeInOut)
                .cornerRadius(10)
                .focused($keyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            keyboardFocused = true
                        }
                    }
            HStack {
                ForEach(taskColors, id: \.self) { taskColor in
                    Circle()
                        .strokeBorder(.black.opacity(0.4), lineWidth:3)
                        .background(Circle().fill(taskColor))
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            selectedColor = taskColor
                        }
                    Spacer()
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
