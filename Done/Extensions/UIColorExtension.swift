//
//  UIColorExtension.swift
//  Done
//
//  Created by Oğuz Karatoruk on 1.11.2022.
//

import Foundation
import UIKit

extension UIColor {
    var name: String {
        switch self {
        case UIColor.red: return "red"
        case UIColor.green: return "green"
        case UIColor.blue: return "blue"
        default: return "clean"
        }
    }
}
