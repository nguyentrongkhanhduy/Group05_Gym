//
//  PersonalTraining.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-14.
//

import Foundation

class PersonalTraining : Service {
    private var _trainer: String
    var trainer: String {
        get {
            return _trainer
        }
        set {
            _trainer = newValue
        }
    }
    
    override var info: String {
        var result = "--------------------------------------------------------\n"
        result += "ID: \(self.id)\nService type: \(self.type)\nName: \(self.name)\nCredit: \(self.price)\nTotal sessions: \(self.totalSession)\n"
        result += "Trainer: \(self.trainer)"
        return result
    }

    init(
        id: Int,
        name: String,
        totalSession: Int = 10,
        price: Double = 50.0,
        trainer: String = "Alex"
    ) {
        self._trainer = trainer
        super.init(id: id, type: "Personal Training", name: name, totalSession: totalSession, price: price)
    }
}
