//
//  Answer.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 08/10/21.
//

import Foundation

struct Answers: Codable {
    var dateTime : Date
    var answers : [Answer]
}

struct Answer: Codable {
    var idCuestion: Int
    var idOption: Int
}
