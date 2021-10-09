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

    func getAnswers() -> Answers? {
        guard Thread.isMainThread else { fatalError("Esta función se debe ejecutar en el hilo principal.") }
        let fetch: NSFetchRequest<AnswersDBNS> = AnswersDBNS.fetchRequest()

        guard let results = try? context.fetch(fetch), let answers = results.first, let answersData = answers.data else { return nil }

        let decoder = JSONDecoder()
        let answersList = try? decoder.decode(Answers.self, from: answersData)
        return answersList
    }

    func setAnswers(answers: Answers) throws {
        guard Thread.isMainThread else { fatalError("Esta función se debe ejecutar en el hilo principal.") }

        deleteAnswers()

        let answersDB = AnswersDBNS(context: context)
        let encoder = JSONEncoder()
        let data = try encoder.encode(answers)
        answersDB.data = data

        try context.save()
    }

    func deleteAnswers() {
        guard Thread.isMainThread else { fatalError("Esta función se debe ejecutar en el hilo principal.") }
        do {
            let fetch: NSFetchRequest<AnswersDBNS> = AnswersDBNS.fetchRequest()

            let results = try context.fetch(fetch)

            results.forEach({ context.delete($0) })
            try context.save()
        } catch {
            debugPrint(error)
        }
    }
}
