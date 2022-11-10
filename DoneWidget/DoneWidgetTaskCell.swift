//
//  DoneWidgetTaskCell.swift
//  Done
//
//  Created by Oguz Personal on 5.11.2022.
//

import SwiftUI

struct DoneWidgetTaskCell: View {
    
    var task: SharedUserDefaults.Task
    
    var body: some View {
        HStack {
            Text(task.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .tint(task.color == "defaultTaskColor" ? Color("textColor") : .white)
                .strikethrough(task.completed, pattern: .dash, color: .black)
                .contentShape(Rectangle())
        }
    }
}



struct DoneWidgetTaskCell_Previews: PreviewProvider {
    static var previews: some View {
        DoneWidgetTaskCell(task: SharedUserDefaults.Task(title: "a", completed: true))
            .padding()
            .previewDisplayName("TaskCell Completed False&Text")
        DoneWidgetTaskCell(task: SharedUserDefaults.Task(title: "a", completed: true))
            .padding()
            .previewDisplayName("TaskCell Completed True&Text")
    }
}
