//
//  UserInfoCard.swift
//  Done
//
//  Created by Oğuz Karatoruk on 12.07.2022.
//

import SwiftUI

struct UserInfoCard: View {
    
    var userImageURL: URL?
    var userProfileName: String?
    var userEmail: String?

    var body: some View {
        HStack {
            NetworkImage(url: userImageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(userProfileName ?? "Oguz Karatoruk")
                    .font(.headline)
                
                Text(userEmail ?? "o.karatoruk@gmail.com")
                    .font(.subheadline)
            }
        }
    }
}

struct UserInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoCard()
            .padding()
            .previewLayout(.fixed(width: 375, height: 120))
            .previewDisplayName("UserInfoCard")
    }
}
