//
//  Date+Extensions.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 09/10/21.
//

import Foundation

extension Date {
    
    func stringFormat() -> String {
        
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        let x = df.string(from: self)
        return x
        
    }
    
}
