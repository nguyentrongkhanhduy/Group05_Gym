//
//  Fitness.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-14.
//

import Foundation

class Fitness : Service {
    private var _duration: Int //minutes
    var duration: Int {
        get {
            return _duration
        }
        set {
            _duration = newValue
        }
    }
    
    override var info: String {
        var result = "--------------------------------------------------------\n"
        result += "ID: \(self.id)\nService type: \(self.type)\nName: \(self.name)\nCredit: \(self.price)\nTotal sessions: \(self.totalSession)\nAttended sessions: \(self.attendedSession)\n"
        result += "Duration: \(self.duration)"
        return result
    }
    
    init(
        id: Int,
        name: String,
        totalSession: Int = 10,
        price: Double = 50.0,
        duration: Int = 60
    ) {
        self._duration = duration
        super.init(id: id, type: "Fitness Class", name: name, totalSession: totalSession, price: price)
    }
}
