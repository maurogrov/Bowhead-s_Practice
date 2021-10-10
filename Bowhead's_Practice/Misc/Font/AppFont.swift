//
//  AppFont.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 06/10/21.
//

import UIKit

protocol AppFontProtocol {
    var name: String { get }
    func font(ofSize size: BowHeadFontSize) -> UIFont
    func attributed(text: String, ofSize size: BowHeadFontSize) -> NSAttributedString
}

extension AppFontProtocol {
    func font(ofSize size: BowHeadFontSize) -> UIFont {
        if let font = UIFont(name: name, size: size.rawValue) {
            return font
        } else {
            print("No se encontró fuente: \(name)")
            return UIFont.systemFont(ofSize: size.rawValue)
        }
    }
    
    func attributed(text: String, ofSize size: BowHeadFontSize) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: [.font: font(ofSize: size )])
    }
}

enum BowHeadFontSize: CGFloat {
    
    case Big = 30
    case Large = 25
    case Medium = 20
    case Normal = 15
    case Minus = 12
    
    var size: CGFloat { self.rawValue }
}
