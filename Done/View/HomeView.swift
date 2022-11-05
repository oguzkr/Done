//
//  HomeView.swift
//  Done
//
//  Created by Oğuz Karatoruk on 11.07.2022.
//

import SwiftUI
import WidgetKit

struct HomeView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    
    let tasks = testDataTasks
    let sharedUserDefaults = UserDefaults(suiteName: SharedUserDefaults.suiteName)
    @State var presentAddNewItem = false
    @State var showSignInForm = false
    
    var body: some View {
       
        NavigationView {
            VStack(alignment: .leading) {
                if taskListVM.taskCellViewModels.count > 0 || self.presentAddNewItem == true {
                    List {
                        ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                            TaskCell(taskCellVM: taskCellVM)
                                .padding(10)
                                .listRowSeparator(.hidden)
                                .background(LinearGradient(gradient: Gradient(colors: taskCellVM.task.color?.toGradientColor ?? [Color(uiColor: UIColor(named: "defaultTaskColor") ?? .clear)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .cornerRadius(5)
                        }
                    }
                    .onAppear(perform: fetch)
                    .listStyle(.plain)
                }
                else {
                    List {
                        EmptyTaskView()
                            .frame(width: 300, height: 300, alignment: .center)
                            .onTapGesture {
                                self.presentAddNewItem.toggle()
                            }
                    }
                }
                
                
                Button(action: {
                    self.presentAddNewItem.toggle()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("addNewTask")
                    }
                }
                .padding()
                .sheet(isPresented: $presentAddNewItem) {
                    AddTaskPopUp(taskText: "")
                }
            }
            .navigationTitle("Done")
        }
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
            print("RELOADING DATA FOR WIDGET")
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

