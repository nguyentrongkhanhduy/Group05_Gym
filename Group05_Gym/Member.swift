//
//  Member.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-15.
//

import Foundation

class Member {
    private var _id: Int
    var id: Int {
        get {
            return _id
        }
    }
    
    private var _name: String
    var name: String {
        get {
            return _name
        }
    }
    
    private var creditBalance: Double = 100.0 {
        didSet {
            print()
            print("New balance: \(self.creditBalance)")
        }
    }
    
    private var _bookedService: [Service] = []
    
    init(id: Int, name:String, bookedService: [Service]) {
        self._id = id
        self._name = name
        self._bookedService = bookedService
    }
    
    init(name: String) {
        self._id = Int.random(in: 1...999)
        self._name = name
    }
    
    func deposit(amount: Double) -> Bool {
        if amount <= 0.0 {
            print("Invalid amount! Please try again")
        } else {
            print("Load credit successfully!")
            self.creditBalance += amount
            return true
        }
        return false
    }
    
    func refund(amount: Double) {
        self.creditBalance += amount
    }
    
    func getBalance() -> Double {
        return self.creditBalance
    }
    
    func getBookedService() -> [Service] {
        return self._bookedService
    }
    
    func markAttendance(id: Int) {
        
    }
}
