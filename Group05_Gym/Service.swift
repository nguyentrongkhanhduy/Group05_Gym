//
//  Service.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-14.
//

import Foundation

class Service : IsPurchasable {
    
    var id: Int
    var type: String
    var name: String
    var totalSession: Int
    var price: Double
    
    var attendedSession = 0
    
    var info: String {
        return ""
    }
 
    init(id: Int, type: String, name: String, totalSession: Int, price: Double) {
        self.id = id
        self.type = type
        self.name = name
        self.totalSession = totalSession
        self.price = price
    }
    
    func printReceipt(type: String, service: Service, success: Bool = false) {
        switch type {
        case "Booking":
            break
        case "Cancellation":
            break
        case "Refund":
            break
        default:
            break
        }
    }
}
