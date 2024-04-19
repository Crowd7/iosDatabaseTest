//
//  AccountDBTable.swift
//  DatabaseTest1
//
//  Created by 李昀璋 on 2024/4/19.
//

import Foundation
import SQLite

/// 帳號 Table
struct AccountDBTable: DBTablable
{
    /// ID
    let id  = Expression<Int64>("id")
    
    /// 姓名
    let name = Expression<String?>("name")
    /// 電話
    let tel = Expression<String?>("tel")
    
    static func createTable() -> String {

        let enity = AccountDBTable()

        return self.table.create(ifNotExists: true){ t in
            t.column(enity.id, primaryKey: true)
            t.column(enity.name)
            t.column(enity.tel)
        }
    }
}
