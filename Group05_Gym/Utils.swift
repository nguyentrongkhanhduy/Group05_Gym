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
            print("Please enter valid input.")
            inputString = readLine()
        }
        return inputString ?? ""
    }
    
    //return 0.0 if invalid
    static func checkInputDouble() -> Double {
        var input: String?
        input = readLine()
        while checkInput(input: input) {
            print("Please enter valid input.")
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
    
    static func checkInputInt() -> Int {
        while true {
            if let input = readLine(), let number = Int(input), number >= 0 {
                return number
            } else {
                print("Please enter valid non-negative integer input.")
            }
        }
    }
    
    //return int in range
    static func checkValidInput(range: ClosedRange<Int>) -> Int {
        var input = checkInputInt()
        while !range.contains(input) {
            print("Please enter valid input.")
            input = checkInputInt()
        }
        return input
    }
    
    static func checkServiceExisted(serviceList: [Service], id: Int) -> Bool {
        for service in serviceList {
            if id == service.id {
                print("Id is already existed. Please choose another id.")
                return true
            }
        }
        return false
    }
    
    static func deepCopyService(service: Service) -> Service {
        switch service.type {
        case "Fitness Class":
            let thisService = service as! Fitness
            let newFitness = Fitness(
                id: thisService.id,
                name: thisService.name,
                totalSession: thisService.totalSession,
                price: thisService.price,
                duration: thisService.duration
            )
            return newFitness
        case "Personal Training":
            let thisService = service as! PersonalTraining
            let newPersonal = PersonalTraining(
                id: thisService.id,
                name: thisService.name,
                totalSession: thisService.totalSession,
                price: thisService.price,
                trainer: thisService.trainer
            )
            return newPersonal
        default:
            return service
        }
    }
    
    static func checkMemberExisted(membershipList: [Member], id: Int) -> Bool {
        for member in membershipList {
            if id == member.id {
                return true
            }
        }
        return false
    }
    
    static func printWithEnter(_ text: String) {
        print(text)
        print("\nPress Enter to continue...")
        _ = readLine()
    }
}
