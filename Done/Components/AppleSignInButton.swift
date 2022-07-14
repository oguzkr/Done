//
//  AppleSignInButton.swift
//  Done
//
//  Created by Oğuz Karatoruk on 14.07.2022.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct AppleSignInButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
}
