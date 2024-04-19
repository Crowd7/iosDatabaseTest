//
//  LocalApiManager.swift
//  DatabaseTest1
//
//  Created by 李昀璋 on 2024/4/19.
//

import Foundation
import SQLite

class LocalApiManager{
    
    
    static let share: LocalApiManager = .init()
    private var localDocumentPath: String {
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
    }
    
    
    var abc:String = {
        
        return ""
    }()
    
    private let tables: [DBTablable.Type] = [
        AccountDBTable.self
    ]
    
    lazy var db: Connection = {
        do {
            print("\n\nApp sandBox 路徑： -------------->")
            print(localDocumentPath)
            print("\n\n")
                        
            let dataBase = try Connection("\(localDocumentPath)/db.sqlite3")

            dataBase.busyTimeout = 5
            
            return dataBase
        } catch let error {
            fatalError("連接資料庫錯誤:\(error.localizedDescription)")
        }
    }()
    
    private init() {
        createTable()
        
    }
    
    /// 新增資料表
    private func createTable() {
        do{
            try db.transaction {
                for t in tables {
                    try db.run(t.createTable())
                }
            }
        } catch let error {
            fatalError("建立 Table 錯誤:\(error.localizedDescription)")
        }
    }
    
}
