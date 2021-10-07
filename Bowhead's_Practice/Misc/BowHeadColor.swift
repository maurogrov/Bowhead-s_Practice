//
//  BowHeadColor.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 06/10/21.
//


import Foundation
import UIKit

enum BowHeadColor: String {
    case GreenAqua
    case Background
    case BackGroundLight
    case ButtonDisabled
    
    
    var color: UIColor {
        return UIColor(named: self.rawValue)!
    }
    var cgColor: CGColor {
        color.cgColor
    }
}
