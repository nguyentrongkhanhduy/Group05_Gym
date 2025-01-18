//
//  Service.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-14.
//

import Foundation

class Service : IsPurchasable {
    private var _id: Int
    var id: Int {
        get {
            return _id
        }
    }
    
    private var _type: String
    var type: String {
        get {
            return _type
        }
    }
    
    private var _name: String
    var name: String {
        get {
            return _name
        }
    }
    
    private var _totalSession: Int
    var totalSession: Int {
        get {
            return _totalSession
        }
        set {
            _totalSession = newValue
        }
    }
    
    private var _price: Double
    var price: Double {
        get {
            return _price
        }
        set {
            _price = newValue
        }
    }
    
    var attendedSession = 0 {
        willSet {
            print()
            print("Session attended: \(newValue)/\(self.totalSession)")
            if(newValue == self.totalSession) {
                print("Congratulations! You have completed \(self.type): \(self.name).")
            } else {
                print("Attend session successfully!")
            }
        }
    }
    
    var info: String {
        return ""
    }
 
    init(id: Int, type: String, name: String, totalSession: Int, price: Double) {
        self._id = id
        self._type = type
        self._name = name
        self._totalSession = totalSession
        self._price = price
    }
    
    func printReceipt(type: String, member: Member) {
        print()
        print("RECEIPT")
        print("--------------------------------------------------------")
        print("Customer: \(member.name)")
        switch type {
        case "Booking":
            print("Booked service: \(self.type)")
            print("Service name: \(self.name)")
            print("Credit: \(self.price)")
        case "Cancellation":
            print("Cancelled service: \(self.type)")
            print("Service name: \(self.name)")
            print("Refunded amount: \(self.price)")
        default:
            break
        }
    }
}
