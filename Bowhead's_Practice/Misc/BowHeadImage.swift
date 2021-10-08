//
//  BowHeadImage.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 06/10/21.
//

import UIKit

enum BowHeadImage: String {
    
    case walle = "walle"
    case manSecurity = "manSecurity"
    case doctors = "doctors"
    
    
    
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
