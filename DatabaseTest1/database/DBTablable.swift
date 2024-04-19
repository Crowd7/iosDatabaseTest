//
//  DBTablable.swift
//  DatabaseTest1
//
//  Created by 李昀璋 on 2024/4/19.
//

import Foundation
import SQLite

/// DB 協定
protocol DBTablable {
    static func createTable() -> String
    
}

extension DBTablable {
    static var tableName: String {
        String(describing: self)
    }
    
    static var table: Table {
        .init(tableName)
    }

}
