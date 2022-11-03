//
//  ContentView.swift
//  Done! Watch App
//
//  Created by Oğuz Karatoruk on 12.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var text = "HAHAHAHA"

    var body: some View {
        VStack {
           
            Button {
                text = "NO."
            } label: {
                Text("click here")
            }
            Spacer(minLength: 10)
            Text(text)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 6 (44mm)"))
            .previewDisplayName("Apple Watch 6 44")
    }
}
