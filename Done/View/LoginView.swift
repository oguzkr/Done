//
//  LoginView.swift
//  Done
//
//  Created by Oğuz Karatoruk on 11.07.2022.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            
            Image("check")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .padding([.top,.bottom], 50)
            
            Text("Bored from complicated todo apps?")
                .fontWeight(.black)
                .foregroundColor(Color("appBlue"))
                .font(.title)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 10)
            
            
            Text("We are not going to ask you to create complicated profile or create a list and customize it. Just add a task, get it done, move to next one.")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
            
            GoogleSignInButton()
                .padding()
                .onTapGesture {
                    viewModel.signIn()
                }
            
            Text("You can also manage your tasks on your Apple Watch")
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
            
        }.background(Color("appDark"))
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
