//
//  BowHeadFont.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 06/10/21.
//

import UIKit

enum BowHeadFont: String, AppFontProtocol {
    case Black = "Poppins-Black"
    case SemiBold = "Poppins-SemiBold"
    case Bold = "Poppins-Bold"
    case ExtraLight = "Poppins-ExtraLight"
    case Italic = "Poppins-Italic"
    case Light = "Poppins-Light"
    case Medium = "Poppins-Medium"
    case Regular = "Poppins-Regular"
    case Thin = "Poppins-Thin"
    
    var name: String { self.rawValue }
}


