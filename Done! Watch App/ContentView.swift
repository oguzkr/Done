//
//  ContentView.swift
//  Done! Watch App
//
//  Created by Oğuz Karatoruk on 12.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "trash")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("ZAAAAA")
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
