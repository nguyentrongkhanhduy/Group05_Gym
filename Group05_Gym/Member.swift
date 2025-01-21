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
    
    func getCancellableService() -> [Service] {
        return self._bookedService.filter { $0.attendedSession < $0.totalSession }
    }
    
    func markAttendance(id: Int) {
        
    }
    
    func getMemberInfo() -> String {
        """
        Member Info:
        - ID: \(self.id)
        - Name: \(self.name)
        - Credit Balance: \(self.creditBalance)
        - Booked Services: \(self._bookedService.map { $0.name }.joined(separator: ", "))
        """
    }
    
    func bookService(_ service: Service) {
        if self.creditBalance >= service.price {
            if !self._bookedService.contains(where: { $0.id == service.id }) {
                self._bookedService.append(service)
                self.creditBalance -= service.price
                print("Book successed!")
                service.printReceipt(type: "Booking", member: self)
                return
            } else {
                print()
                print("Book Failed: You have already booked this service!")
                return
            }
        } else {
            print()
            print("Book Failed: Not enough credit balance!")
            return
        }
        
    }
    
    func cancelService(_ service: Service) {
        if self._bookedService.contains(where: { $0.id == service.id }) {
            if service.attendedSession <= 1 {
                self._bookedService.removeAll { $0.id == service.id }
                self.creditBalance += service.price
                print("Cancel successed!")
                service.printReceipt(type: "Cancellation", member: self)
                return
            } else {
                print("Cancel Failed: you has attended more than 1 sessions of the service!")
            }
        } else {
            print()
            print("Cancel Failed: You haven't booked this service!")
            return
        }
    }
}
