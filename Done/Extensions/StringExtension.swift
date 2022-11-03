//
//  StringExtension.swift
//  Done
//
//  Created by Oğuz Karatoruk on 1.11.2022.
//

import UIKit
import SwiftUI

extension String {
    var name: UIColor {
        switch self {
        case "red": return UIColor.red
        case "blue": return UIColor.blue
        case "green": return UIColor.green
        case "clean": return UIColor(Color("defaultTaskColor"))
        default: return UIColor(Color("defaultTaskColor"))
        }
    }
}
