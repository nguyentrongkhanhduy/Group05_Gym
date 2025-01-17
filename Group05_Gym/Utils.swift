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
    
    static func checkInputString() -> String {
        var inputString: String?
        inputString = readLine()
        while checkInput(input: inputString) {
            print("Please choose valid input.")
            inputString = readLine()
        }
        return inputString ?? ""
    }
    
    //return 0.0 if invalid
    static func checkInputDouble() -> Double {
        var input: String?
        input = readLine()
        while checkInput(input: input) {
            print("Please choose valid input.")
            input = readLine()
        }
        guard let number = Double(input!) else {
            return 0.0
        }
        if number > 0.0 {
            return number
        }
        return 0.0
    }
    
    //return -1 if invalid
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
    
    //return int in range
    static func checkValidInput(range: ClosedRange<Int>) -> Int {
        var input = checkInputInt()
        while !range.contains(input) {
            print("Please choose valid input.")
            input = checkInputInt()
        }
        return input
    }
}
