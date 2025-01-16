//
//  Service.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-14.
//

import Foundation

enum Weekdays {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

class Service {
    var id: Int = 0
    var name: String = "Service"
    var totalSession: Int = 0
    var price: Double = 0.0
    var session: [(Weekdays,[String])] = [
        (Weekdays.Monday, []),
        (Weekdays.Tuesday, []),
        (Weekdays.Wednesday, []),
        (Weekdays.Thursday, []),
        (Weekdays.Friday, []),
        (Weekdays.Saturday, []),
        (Weekdays.Sunday, []),
    ]
}
