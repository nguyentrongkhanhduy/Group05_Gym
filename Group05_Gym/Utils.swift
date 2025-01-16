//
//  Utils.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-14.
//

import Foundation

class Utils {
    static func checkInput(input: String?) -> Bool {
        if input == nil || input!.isEmpty {
            return true
        }
        return false
    }
    
    static func checkInputInt() -> Int {
        var inputMemberType: String?
        inputMemberType = readLine()
        while checkInput(input: inputMemberType) {
            print("Please choose valid input.")
            inputMemberType = readLine()
        }
        if let number = Int(inputMemberType!) {
            return number
        }
        return -1
    }
    
    static func checkValidInput(range: ClosedRange<Int>) -> Int {
        var input = checkInputInt()
        while !range.contains(input) {
            print("Please choose valid input.")
            input = checkInputInt()
        }
        return input
    }
}
