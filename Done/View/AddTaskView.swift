//
//  AddTaskView.swift
//  Done
//
//  Created by Oğuz Karatoruk on 30.10.2022.
//

import SwiftUI
import WidgetKit

struct AddTaskView: View {
    
    @Environment (\.presentationMode) var presentationMode
    @FocusState private var keyboardFocused: Bool
    @ObservedObject var taskListVM = TaskListViewModel()
    @State var selectedColor = "defaultTaskColor"
    @State private var addButtonDisabled = true
    @State var taskText: String
    @State var taskToEdit: Task?
    let sharedUserDefaults = UserDefaults(suiteName: SharedUserDefaults.suiteName)
    
    let taskColorsGradients = ["defaultTaskColor",
                               "darkNight",
                               "kingYna",
                               "miamiDolphins",
                               "flare",
                               "rainbowBlue",
                               "timber",
                               "witchingHour",
                               "asteroid",
                               "quepal"]

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    LinearGradient(
                        colors: selectedColor.toCustomizedButtonColor(),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: 80, height: 25)
                    .mask(
                        Text("cancel")
                            .multilineTextAlignment(.center)
                    )
                })
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(LinearGradient(gradient: Gradient(colors: selectedColor.toGradientColor), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                )
                Spacer(minLength: 10)
                Button(action: {
                    if let taskToEdit {
                        self.taskListVM.updateTask(task: Task(
                            id: taskToEdit.id,
                            title: taskToEdit.title,
                            completed: taskToEdit.completed,
                            userId: taskToEdit.userId,
                            color: selectedColor.description))
                    } else {
                        self.taskListVM.addTask(task: Task(title: self.taskText, completed: false, color: selectedColor.description))
                    }
                    self.fetch()
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text(taskToEdit?.id?.isEmpty ?? true ? "add" : "update")
                        .foregroundColor(selectedColor == "defaultTaskColor" ? Color("textColor") : .white)
                        .frame(width: 80, height: 25)
                })
                .disabled(addButtonDisabled && taskToEdit?.title.isEmpty ?? true)
                .frame(width: 80)
                .padding(10)
                .background(selectedColor == "defaultTaskColor" ? LinearGradient(gradient: Gradient(colors: [Color("appBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(gradient: Gradient(colors: selectedColor.toGradientColor), startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(addButtonDisabled && taskToEdit?.title.isEmpty ?? true ? 0.5 : 1)
                .cornerRadius(5)
            }
            Spacer(minLength: 20)
            TextEditor(text: $taskText)
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .padding(EdgeInsets(top:10, leading:10, bottom: 10, trailing: 30))
                .scrollContentBackground(.hidden)
                .foregroundColor(selectedColor == "defaultTaskColor" ? Color("textColor") : .white)
                .background(LinearGradient(gradient: Gradient(colors: selectedColor.toGradientColor), startPoint: .topLeading, endPoint: .bottomTrailing).onAppear())
                .cornerRadius(10)
                .focused($keyboardFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        keyboardFocused = true
                    }
                }
                .onChange(of: self.taskText, perform: { value in
                    addButtonDisabled = value.count > 0 ? false : true
                    taskToEdit?.title = value
                })
            
           
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(taskColorsGradients, id: \.self) { taskColor in
                        Circle()
                            .strokeBorder(selectedColor == taskColor ? .black.opacity(0.6) : .black.opacity(0.4), lineWidth:3)
                            .background(Circle().fill(LinearGradient(gradient: Gradient(colors: taskColor.toGradientColor), startPoint: .topLeading, endPoint: .bottomTrailing)))
                            .frame(width: 40, height: 40)
                            .padding(.leading)
                            .onTapGesture {
                                selectedColor = taskColor
                            }
                        Spacer()
                    }
                }
            }
        }
        .padding(25)
    }
    
    func fetch(){
        var tasks = [SharedUserDefaults.Task]()
        for taskVM in taskListVM.taskCellViewModels {
            tasks.append(SharedUserDefaults.Task(id: taskVM.task.id,
                                                 title: taskVM.task.title,
                                                 completed: taskVM.task.completed,
                                                 color: taskVM.task.color))
        }
        if let encodedData = try? JSONEncoder().encode(tasks) {
            sharedUserDefaults?.set(encodedData, forKey: SharedUserDefaults.Keys.tasks)
            WidgetCenter.shared.reloadAllTimelines()
        }
    }

}

struct AddTaskPopUp_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskText: "Destroy the world")
            .padding()
            .previewDisplayName("Add task cell")
    }
}
