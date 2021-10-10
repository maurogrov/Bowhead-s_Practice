//
//  StartTestBR.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 10/10/21.
//

import UIKit

class StartTestBR {
    
    //MARK: -MSJ
    var saveSuccess = "Success"
    var error = "Please try later"
    var createBox = "do you want to create the data test?"
    var deleteBox = "do you want to delete the data test?"
    
    //MARK: -PROPERTIES
    let trashImage = UIImage(systemName: "trash")!
    let boxImage = UIImage(systemName: "cube.box")!
    
    //MARK: -IS
    var canSubmitBtnAct: Bool {
        var isEnable = true
        for cuestion in cuestions {
            if cuestion.options.filter({ $0.selected }).count == 0 {
                isEnable = false
                break
            }
        }
        return isEnable
        
    }

    //MARK: -BUILDERS
    func formatCuestions(){
        for (indey, cuesion) in cuestions.enumerated() {
            for (indez, _) in cuesion.options.enumerated(){
                cuestions[indey].options[indez].selected = false
            }
        }
    }
    
    func createAnswerToday() -> Answers {
        var answersToday = Answers(dateTime: Date(), answers: [])
        
        for cuestion in cuestions {
            let optionSelected = cuestion.options.filter({ $0.selected }).first!
            answersToday.answers.append(
                Answer(idCuestion: cuestion.idCuestion, idOption: optionSelected.id)
            )
        }
        
        return answersToday
    }
 
    func createCuestionsRandom(){
        
        for _ in 1...5 {
            let day = Calendar.current.component(.day, from: Date())
            let randomDay = Int.random(in: 1..<day)
            
            var dateComponents = DateComponents()
            dateComponents.year = Calendar.current.component(.year, from: Date())
            dateComponents.month = Calendar.current.component(.month, from: Date())
            dateComponents.day = randomDay
            dateComponents.timeZone = TimeZone.current
            dateComponents.hour = 12
            dateComponents.minute = 00

            let userCalendar = Calendar(identifier: .gregorian)
            guard let someDateTime = userCalendar.date(from: dateComponents) else { return }
            
            var answersDate = Answers(dateTime: someDateTime, answers: [])
            
            for cuestion in cuestions {
                
                let indiceOption = Int.random(in: 0..<cuestion.options.count)
                let option = cuestion.options[indiceOption]
                
                answersDate.answers.append(
                    Answer(idCuestion: cuestion.idCuestion, idOption: option.id)
                )
            }
            
            try? AnswersDB.shared.setAnswers(answers: answersDate, completionHandler: nil)
        }
    }
    
}
