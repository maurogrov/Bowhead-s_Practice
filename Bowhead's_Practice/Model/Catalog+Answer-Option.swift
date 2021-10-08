//
//  Catalog+Answer-Option.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 08/10/21.
//

import Foundation

var cuestions : [Cuestion] = [
    Cuestion(
        idCuestion: 1,
        name: "How do you feel?",
        typeAnswer: "Feeling",
        options: [
            Option(id: 1, name: "Perfect, thank you!", response: "Perfect"),
            Option(id: 2, name: "Meh, I'm alive", response: "Alive"),
            Option(id: 3, name: "Worst day ever", response: "Worst")
    ]),
    Cuestion(
        idCuestion: 2,
        name: "Did you sleep well",
        typeAnswer: "Sleep quality",
        options: [
            Option(id: 4, name: "Yes", response: "Good"),
            Option(id: 5, name: "No", response: "Bad")
    ])
]
