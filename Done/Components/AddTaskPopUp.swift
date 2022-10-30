//
//  AddTaskPopUp.swift
//  Done
//
//  Created by Oğuz Karatoruk on 30.10.2022.
//

import SwiftUI

struct AddTaskPopUp: View {
    
    @State var taskText: String
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    //TODO: CLOSE POPUP
                }, label: {
                    Text("Cancel")
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
                    //TODO: CLOSE POPUP, ADD TASK
                }, label: {
                    Text("Add")
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
                
        }
    }
}

struct AddTaskPopUp_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskPopUp(taskText: "Task skajfkasjf")
            .padding()
            
            .previewDisplayName("Add task cell")
    }
}
