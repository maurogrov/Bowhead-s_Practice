//
//  AnswersDB.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 09/10/21.
//

import UIKit
import CoreData


class AnswersDB {
    static let shared = AnswersDB()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    private init() {
    }

    func getAnswers() -> [Answers] {
        guard Thread.isMainThread else { fatalError("Esta función se debe ejecutar en el hilo principal.") }
        let fetch: NSFetchRequest<AnswersDBNS> = AnswersDBNS.fetchRequest()

        guard let results = try? context.fetch(fetch) else { return [] }

        
        var dbAnswers : [Answers] = []
        for data in results {
            let answers = data.data!
            let decoder = JSONDecoder()
            let answersList = try? decoder.decode(Answers.self, from: answers)
            dbAnswers.append(answersList!)
        }
      
        return dbAnswers
    }

    func setAnswers(answers: Answers, completionHandler : (() -> Void)?) throws {
        guard Thread.isMainThread else { fatalError("Esta función se debe ejecutar en el hilo principal.") }

        let result = AnswersDB.shared.getAnswers()
        var idAnswer : Int
        
        if result.count != 0 {
            idAnswer = result.last!.id + 1
            
            let itemRepeat = result.filter({ $0.dateTime.stringFormat() == answers.dateTime.stringFormat() })
                
            for item in itemRepeat {
                deleteById(item.id)
            }
        }else { idAnswer = 1 }
        
        var save = answers
        save.id = idAnswer
        
        let answersDB = AnswersDBNS(context: context)
        let encoder = JSONEncoder()
        let data = try encoder.encode(save)
        answersDB.data = data

        try context.save()
        completionHandler?()
    }
    
    
    private func deleteById(_ id: Int)  {
        guard Thread.isMainThread else { fatalError("Esta función se debe ejecutar en el hilo principal.") }
        do {
            let fetch: NSFetchRequest<AnswersDBNS> = AnswersDBNS.fetchRequest()
            let results = try context.fetch(fetch)

            results.forEach({
                let answers = $0.data!
                let decoder = JSONDecoder()
                let ans = try! decoder.decode(Answers.self, from: answers)
                if ans.id == id {
                    context.delete($0)
                }
            })
            try context.save()
        } catch {
            debugPrint(error)
        }
    }

    func deleteAllAnswers() {
        guard Thread.isMainThread else { fatalError("Esta función se debe ejecutar en el hilo principal.") }
        do {
            let fetch: NSFetchRequest<AnswersDBNS> = AnswersDBNS.fetchRequest()

            let results = try context.fetch(fetch)
            results.forEach({ context.delete($0) })
            
            let result2 = try context.fetch(fetch)
            print(result2)
            try context.save()
            
        } catch {
            debugPrint(error)
        }
    }
}
