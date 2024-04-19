//
//  Account.swift
//  DatabaseTest1
//
//  Created by 李昀璋 on 2024/4/19.
//

import Foundation

class Account{
    
    var id:Int = 0
    var name:String = ""
    var tele:String = ""

    init(id: Int, name: String, tele: String) {
        self.id = id
        self.name = name
        self.tele = tele
    }
}
