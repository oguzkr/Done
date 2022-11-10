//
//  StringExtension.swift
//  Done
//
//  Created by Oğuz Karatoruk on 1.11.2022.
//

import UIKit
import SwiftUI

extension String {
    var toGradientColor: [Color] {
        switch self {
        case "fiftyShadesOfBlue": return [Color("1"), Color("2"), Color("3")]
        case "fiftyShadesOfGreen": return [Color("4"), Color("5"), Color("6")]
        case "darkHumor": return [Color("7"), Color("8"), Color("9")]
        case "defaultTaskColor": return [Color("defaultTaskColor")]
        case "textColor": return [Color(uiColor: UIColor(named: "textColor") ?? .clear)]
        default: return [Color("defaultTaskColor")]
        }
    }
    
    func toCustomizedButtonColor() -> [Color] {
        return self == "defaultTaskColor" ? [Color(uiColor: UIColor(named: "textColor") ?? .clear)] : self.toGradientColor
    }
}
