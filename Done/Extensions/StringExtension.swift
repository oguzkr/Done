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
        case "redToGreen": return [.red, .green]
        case "blueToGreen": return [.blue, .green]
        case "blueToRed": return [.blue, .red]
        case "defaultTaskColor": return [Color("defaultTaskColor")]
        case "defaultTextColor": return [Color.white]
        default: return [Color("defaultTaskColor")]
        }
    }
}
