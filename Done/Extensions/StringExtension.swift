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
//        switch self {
//        case "fiftyShadesOfBlue": return [Color("1"), Color("2"), Color("3")]
//        case "fiftyShadesOfGreen": return [Color("4"), Color("5"), Color("6")]
//        case "darkHumor": return [Color("7"), Color("8"), Color("9")]
//        case "defaultTaskColor": return [Color("defaultTaskColor")]
//        case "textColor": return [Color(uiColor: UIColor(named: "textColor") ?? .clear)]
//        default: return [Color("defaultTaskColor")]
//        }
        switch self {
        case "darkNight": return [Color("darkNight1"),Color("darkNight2")]
        case "kingYna": return [Color("kingYna1"),Color("kingYna2"),Color("kingYna3")]
        case "miamiDolphins": return [Color("miamiDolphins1"),Color("miamiDolphins2")]
        case "rainbowBlue": return [Color("rainbowBlue1"),Color("rainbowBlue2")]
        case "flare": return [Color("flare1"),Color("flare2")]
        case "timber": return [Color("timber1"),Color("timber2"),Color("timber3")]
        case "witchingHour": return [Color("witchingHour1"),Color("witchingHour2")]
        case "asteroid": return [Color("asteroid1"),Color("asteroid2"),Color("asteroid3")]
        case "quepal": return [Color("quepal1"),Color("quepal2")]


        default: return [Color("defaultTaskColor")]
        }
    }
    
    func toCustomizedButtonColor() -> [Color] {
        return self == "defaultTaskColor" ? [Color("textColor")] : self.toGradientColor
    }
}
