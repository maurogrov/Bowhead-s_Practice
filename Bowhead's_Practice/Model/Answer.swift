//
//  Answer.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 08/10/21.
//

import Foundation

struct Answers: Codable {
    var id: Int = 0
    var dateTime : Date
    var answers : [Answer]
}

struct Answer: Codable {
    var idCuestion: Int
    var idOption: Int
}
