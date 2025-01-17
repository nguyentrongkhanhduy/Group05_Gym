//
//  Member.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-15.
//

import Foundation

class Member {
    var id: Int = 123
    var name: String
    var creditBalance: Double = 100.0
    
    var bookedService: [Service] = [
        
    ]
    
    init(name: String) {
        self.name = name
    }
    
    func deposit(amount: Double) {
        
    }
    
    func getBalance() -> Double {
        return self.creditBalance
    }
    
    func getBookedService() -> [Service] {
        return self.bookedService
    }
    
    func markAttendance(id: Int) {
        
    }
}
