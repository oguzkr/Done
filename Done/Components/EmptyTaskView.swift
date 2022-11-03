//
//  EmptyTaskView.swift
//  Done
//
//  Created by Oğuz Karatoruk on 14.07.2022.
//

import SwiftUI

struct EmptyTaskView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("appBlue"))
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .frame(width: 80, height: 80)
            }
            Text("addYourFirstTask")
                .foregroundColor(Color("appBlue"))
                .font(.title)
        }.padding()
        
    }
}

struct EmptyTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTaskView()
            .padding()
            .previewLayout(.fixed(width: 300, height: 300))
            .previewDisplayName("EmptyTaskView")
    }
}
