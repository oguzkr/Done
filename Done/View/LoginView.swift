//
//  LoginView.swift
//  Done
//
//  Created by Oğuz Karatoruk on 11.07.2022.
//

import SwiftUI

struct LoginView: View {
    
    @Environment (\.presentationMode) var presentationMode
    @State var coordinator: SignInWithAppleCoordinator?

    var body: some View {
        VStack{
            Color("appDark").ignoresSafeArea()
            
            Image("check")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .padding([.top,.bottom], 50)
            
            Text("Access your todos from on device")
                .fontWeight(.black)
                .foregroundColor(Color("appBlue"))
                .font(.title)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 10)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("We are not going to ask you to create complicated profile or create a list and customize it. Just add a task, get it done, move to next one.")
                .padding()
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
            
//            AppleSignInButton()
//                .padding()
//                .frame(height: 80)
//                .onTapGesture {
//                    self.coordinator = SignInWithAppleCoordinator()
//                    if let coordinator = self.coordinator {
//                        coordinator.startSignInWithAppleFlow {
//                            self.presentationMode.wrappedValue.dismiss()
//                        }
//                    }
//                }
            
            Text("You can also manage your tasks on your Apple Watch")
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
            Color("appDark").ignoresSafeArea()
        }
        .background(Color("appDark"))
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
