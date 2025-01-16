//
//  Gym.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-14.
//

import Foundation

class Gym {
    
    var serviceList: [Service] = [Service()]
    
    func launch() {
        print("Welcome to the Gym")
        print("Please select user type:")
        print("     1. Owner")
        print("     2. Member")
        print("     3. Exit")
        
        switch Utils.checkValidInput(range: 1...3) {
        case 1:
            beginOwnerAction()
        case 2:
            beginMemberAction()
        case 3:
            print("Exiting the system... See you again!")
        default:
            break
        }
    }
    
    func beginOwnerAction() {
        print()
        print("Hi Gym Owner, please select your action:")
        print("     1. Manage services")
        print("     2. Search")
        print("     3. View all services")
        print("     4. Return")
        
        switch Utils.checkValidInput(range: 1...4) {
        case 4:
            launch()
        default:
            break
        }
    }
    
    func beginMemberAction() {
        print()
        print("Hi, please select an option to continue to the services:")
        print("     1. Input member ID")
        print("     2. Create membership")
        print("     3. Return")
        
        switch Utils.checkValidInput(range: 1...3) {
        case 3:
            launch()
        default: break
        }
    }
}
