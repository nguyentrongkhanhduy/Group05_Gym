//
//  PersonalTraining.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-14.
//

import Foundation

class PersonalTraining : Service {
    var trainer: String
    
    override var info: String {
        var result = "--------------------------------------------------------\n"
        result += "ID: \(self.id)\nService type: \(self.type)\nName: \(self.name)\nPrice: \(self.price)\nTotal sessions: \(self.totalSession)\n"
        result += "Trainer: \(self.trainer)\n"
        return result
    }

    init(
        id: Int,
        name: String,
        totalSession: Int = 10,
        price: Double = 50.0,
        trainer: String = "Alex"
    ) {
        self.trainer = trainer
        super.init(id: id, type: "Personal Training", name: name, totalSession: totalSession, price: price)
    }
}
