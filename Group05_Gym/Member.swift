//
//  Member.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-15.
//

import Foundation

class Member {
    var id: Int = 123456
    var name: String
    var creditBalance: Double = 100.0
    
    var bookedService: [Service] = []
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    func bookService() {
        
    }
}
