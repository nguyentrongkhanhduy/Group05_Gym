//
//  Fitness.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-14.
//

import Foundation

class Fitness : Service {
    var duration: Int //minutes
    
    override var info: String {
        var result = "--------------------------------------------------------\n"
        result += "ID: \(self.id)\nService type: \(self.type)\nName: \(self.name)\nPrice: \(self.price)\nTotal sessions: \(self.totalSession)\n"
        result += "Trainer: \(self.duration)\n"
        return result
    }
    
    init(
        id: Int,
        name: String,
        totalSession: Int = 10,
        price: Double = 50.0,
        duration: Int = 60
    ) {
        self.duration = duration
        super.init(id: id, type: "Fitness Class", name: name, totalSession: totalSession, price: price)
    }
}
