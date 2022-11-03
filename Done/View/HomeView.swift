//
//  HomeView.swift
//  Done
//
//  Created by Oğuz Karatoruk on 11.07.2022.
//

import SwiftUI
//MARK: BUG: ilk eklemeden sonraki eklemelerde surekli ilk taskin titleini aliyor

struct HomeView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    
    let tasks = testDataTasks
    
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
                            .listRowBackground(Color.clear)
                            .background(Color(uiColor: taskCellVM.task.color?.name ?? UIColor(Color("defaultTaskColor"))))
                            .cornerRadius(5)
                    }
                }.listStyle(.plain)
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
            }
                
            Button(action: {
                self.presentAddNewItem.toggle()
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Add New Task")
                }
            }
            .padding()
            .sheet(isPresented: $presentAddNewItem) {
                AddTaskPopUp(taskText: "")
            }
                
            }
            .sheet(isPresented: $showSignInForm) {
                LoginView()
            }
            .navigationTitle("Done")
        }
    }
    }

    struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
    }

