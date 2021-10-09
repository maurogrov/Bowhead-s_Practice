//
//  UserAccountDB.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 09/10/21.
//

import UIKit
import CoreData

class UserAccountDB {
    
    static let shared = UserAccountDB()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init() {
    }
    
    func getCuenta() -> UserAccount? {
        guard Thread.isMainThread else { fatalError("Esta función se debe ejecutar en el hilo principal.") }
        let fetch: NSFetchRequest<UserAccountDBNS> = UserAccountDBNS.fetchRequest()
        
        guard let results = try? context.fetch(fetch), let cuentaGuardada = results.first, let dataCuenta = cuentaGuardada.data else { return nil }
        
        let decoder = JSONDecoder()
        let cuenta = try? decoder.decode(UserAccount.self, from: dataCuenta)
        return cuenta
    }
    
    func set(cuenta: UserAccount) throws {
        guard Thread.isMainThread else { fatalError("Esta función se debe ejecutar en el hilo principal.") }
        
        deleteCuenta()
        
        let cuentaNueva = UserAccountDBNS(context: context)
        let encoder = JSONEncoder()
        let data = try encoder.encode(cuenta)
        cuentaNueva.data = data
        
        try context.save()
    }
    
    func deleteCuenta() {
        guard Thread.isMainThread else { fatalError("Esta función se debe ejecutar en el hilo principal.") }
        do {
            let fetch: NSFetchRequest<UserAccountDBNS> = UserAccountDBNS.fetchRequest()
            
            let results = try context.fetch(fetch)
            
            results.forEach({ context.delete($0) })
            try context.save()
        } catch {
            debugPrint(error)
        }
    }
    
}
