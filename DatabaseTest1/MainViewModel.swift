//
//  MainViewModel.swift
//  DatabaseTest1
//
//  Created by 李昀璋 on 2024/4/19.
//

import Foundation
import SQLite

class MainViewModel {
    var accountList:[Account] = [Account]()
    
    func insertAccount(name:String, tele:String){
        do{
            let entity = AccountDBTable()
            
            var setter:[Setter] = [
                entity.name <- name,
                entity.tel <- tele
            ]
            
            try LocalApiManager.share.db.run(AccountDBTable.table.insert(or:.replace, setter))
        }catch let error{
            
            
            
            
        }
    }

    func queryAccountAll(){
        do{
            let entity = AccountDBTable()
            let table = AccountDBTable.table
            var acList = [Account]()
            
            for ac in try LocalApiManager.share.db.prepare(table){
                let id = Int(ac[entity.id])
                let name = ac[entity.name] ?? ""
                let tele = ac[entity.tel] ?? ""
                
                let model = Account(id:id, name:name, tele:tele)
                
                acList.append(model)
            }
            
            accountList.removeAll()
            accountList+=acList
        
        }catch let error{
            
            
            
            
        }
    }
}
