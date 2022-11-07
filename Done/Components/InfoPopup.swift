//
//  InfoPopup.swift
//  Done
//
//  Created by Oguz Personal on 7.11.2022.
//

import SwiftUI

struct InfoText: Hashable {
    let id: Int
    let text: String
}

struct InfoPopup: View {
    
    @State private var pageIndex = 0
    @Environment(\.colorScheme) var colorScheme

    private let infoTexts = [
        InfoText(id: 0, text: "Hi, you don't have to create new account or.."),
        InfoText(id: 1, text: "set complicated customizations for your todos."),
        InfoText(id: 2, text: "Just add something to keep in mind, get it done, move to next one.")]
    
    
    var body: some View {
        VStack {
            TabView(selection: $pageIndex) {
                ForEach(infoTexts, id: \.self) { infoText in
                    VStack {
                        LinearGradient(
                            colors: [.red, .blue, .green, .yellow],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .mask(
                            Text(infoText.text)
                                .font(Font.system(size: 30, weight: .bold))
                                .multilineTextAlignment(.center)
                                .padding()
                                .offset(x: 0, y: -10)
                                
                            
                        )
                        HStack {
                            
                            Image(systemName: pageIndex == 0 ? "arrow.right.circle" : "arrow.left.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .offset(x: 0, y: -45)
                                .onTapGesture {
                                    if pageIndex == 0 {
                                        pageIndex += 1
                                    } else {
                                        pageIndex -= 1
                                    }
                                }
                            if pageIndex != 0 {
                                Image(systemName: pageIndex == 2 ? "hand.thumbsup.circle" : "arrow.right.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .colorInvert()
                                    .offset(x: 0, y: -45)
                                    .onTapGesture {
                                        if pageIndex == 2 {
                                            print("close")
                                        } else {
                                            pageIndex += 1
                                        }
                                    }
                            }
                        }
                        
                    }.tag(infoText.id)
                }
                
            }
            .padding()
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .animation(.easeOut(duration: 0.2), value: pageIndex)
            .transition(.slide) // 3
        }
        
        .background(LinearGradient(gradient: Gradient(colors: [Color(uiColor: #colorLiteral(red: 0.131776964, green: 0.1771368398, blue: 0.2837292386, alpha: 1)), Color(uiColor: #colorLiteral(red: 0.1104041667, green: 0.1116397569, blue: 0.299160043, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
    }
}

struct InfoPopup_Previews: PreviewProvider {
    static var previews: some View {
        InfoPopup()
            .padding()
            .previewLayout(.fixed(width: 375, height: 300))
            .previewDisplayName("InfoPopup")
    }
}

