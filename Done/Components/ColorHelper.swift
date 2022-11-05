//
//  ColorHelper.swift
//  Done
//
//  Created by Oguz Personal on 5.11.2022.
//

import Foundation
import SwiftUI

struct ColorHelper {
    @Environment(\.colorScheme) var colorScheme

    static let taskColorsGradients = ["defaultTaskColor",
                                      "redToGreen",
                                      "blueToGreen",
                                      "blueToRed"]
    
    static func gradientFromString(_ stringGradientKey: String) -> [Color] {
        var color = [Color]()
        for gradient in taskColorsGradients {
            if gradient == "redToGreen" {
                color = [.red, .green]
            } else if gradient == "blueToGreen" {
                color = [.blue, .green]
            } else if gradient == "blueToRed" {
                color = [.blue, .red]
            } else {
                color = [Color(uiColor: UIColor(named: "defaultTaskColor") ?? .clear)]
            }
        }
        return color
    }
    
    static func stringFromGradient(_ colors: [Color]) -> String {
        var stringColor = String()
        if colors == [.red, .green] {
            stringColor = "redToGreen"
        } else if colors == [.blue, .green]  {
            stringColor = "blueToGreen"
        } else if colors == [.blue, .red]  {
            stringColor = "blueToRed"
        }
        return stringColor
    }
    
    static func customizedButtonColor(_ selectedColorString: String) -> [Color] {
        return selectedColorString == "defaultTaskColor" ? [Color(uiColor: UIColor(named: "textColor") ?? .clear)] : selectedColorString.toGradientColor
    }
    
}
