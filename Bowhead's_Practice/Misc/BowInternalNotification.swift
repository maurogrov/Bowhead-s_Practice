//
//  BowInternalNotification.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 09/10/21.
//

import Foundation


enum BowInternalNotification: String {
    case hijoControlador
  
    var name: NSNotification.Name {
        return NSNotification.Name("@AppBowHeadPractice/\(self.rawValue)")
    }
}

