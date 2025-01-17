//
//  Gym.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-14.
//

import Foundation

class Gym {
    var serviceList: [Service] = [
        Fitness(
            id: 1,
            name: "Full Body Cardio",
            totalSession: 10,
            price: 30.0,
            duration: 30
        ),
        Fitness(
            id: 2,
            name: "Upper Body Cardio",
            totalSession: 12,
            price: 30.0,
            duration: 20
        ),
        Fitness(
            id: 3,
            name: "Abs And Shoulder",
            totalSession: 8,
            price: 30.0,
            duration: 25
        ),
        PersonalTraining(
            id: 4,
            name: "Leg Press",
            totalSession: 5,
            price: 60.0,
            trainer: "Alex"
        ),
        PersonalTraining(
            id: 5,
            name: "Triceps",
            totalSession: 9,
            price: 60.0,
            trainer: "Jordan"
        ),
        PersonalTraining(
            id: 6,
            name: "Abs",
            totalSession: 2,
            price: 60.0,
            trainer: "Jordan"
        )
    ] //testing
    
    func launch() {
        while true {
            print()
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
                return
            default:
                return
            }
        }
        
        
    }
    
    func beginOwnerAction() {
        while true {
            print()
            print("Hi Gym Owner, please select your action:")
            print("     1. Add new service")
            print("     2. Search")
            print("     3. View all services")
            print("     4. Return")
            
            switch Utils.checkValidInput(range: 1...4) {
            case 1:
                addService()
            case 2:
                searchService()
            case 3:
                printAllServices()
            case 4:
                return
            default:
                return
            }
        }
    }
    
    func addService() {
        while true {
            print()
            print("Please select service type")
            print("     1. Fitness Class")
            print("     2. Personal Training")
            print("     3. Return")
            
            switch Utils.checkValidInput(range: 1...3) {
            case 1:
                addFitnessClass()
                return
            case 2:
                addPersonalTraining()
                return
            case 3:
                return
            default:
                return
            }
        }
    }
    
    func addFitnessClass() {
        while true {
            print()
            print("Please create an ID for the service:")
            var newId = Utils.checkInputInt()
            if Utils
                .checkServiceExisted(serviceList: self.serviceList, id: newId) {
                continue
            }
            
            print("Please enter class name:")
            let newName = Utils.checkInputString()
            
            let newFitness =  Fitness(
                id: newId,
                name: newName
            )
            
            print("Please enter number of sessions:")
            let newTotal = Utils.checkInputInt()
            if newTotal != -1 {
                newFitness.totalSession = newTotal
            }
            
            print("Please enter class price:")
            let newPrice = Utils.checkInputDouble()
            if newPrice != 0.0 {
                newFitness.price = newPrice
            }
            
            print("Please enter class duration")
            let newDuration = Utils.checkInputInt()
            if newDuration != -1 {
                newFitness.duration = newDuration
            }
            
            serviceList.append(newFitness) //add to service list
            
            print()
            print("New Fitness Class has successfully been created!")
            
            return
        }
    }
    
    func addPersonalTraining() {
        while true {
            print()
            print("Please create an ID for the service:")
            var newId = Utils.checkInputInt()
            if Utils
                .checkServiceExisted(serviceList: self.serviceList, id: newId) {
                continue
            }
            
            print("Please enter class name:")
            let newName = Utils.checkInputString()
            
            let newPersonal =  PersonalTraining(
                id: newId,
                name: newName
            )
            
            print("Please enter number of sessions:")
            let newTotal = Utils.checkInputInt()
            if newTotal != -1 {
                newPersonal.totalSession = newTotal
            }
            
            print("Please enter class price:")
            let newPrice = Utils.checkInputDouble()
            if newPrice != 0.0 {
                newPersonal.price = newPrice
            }
            
            print("Please enter trainer's name")
            let newTrainer = Utils.checkInputString()
            newPersonal.trainer = newTrainer
            
            serviceList.append(newPersonal) //add to service list
            
            print()
            print("New Personal Training session has successfully been created!")
            
            return
        }
    }
    
    func printAllServices() {
        print()
        for service in serviceList {
            if service is Fitness {
                let thisFitness = service as! Fitness
                print(thisFitness.info)
            } else {
                let thisPersonal = service as! PersonalTraining
                print(thisPersonal.info)
            }
        }
    }
    
    func searchService() {
        while true {
            print()
            print("Please enter Service ID or keyword:")
            let keyword = Utils.checkInputString()
            if let number = Int(keyword) {
                for service in serviceList {
                    if service.id == number {
                        if service is Fitness {
                            let thisFitness = service as! Fitness
                            print(thisFitness.info)
                        } else {
                            let thisPersonal = service as! PersonalTraining
                            print(thisPersonal.info)
                        }
                        return
                    }
                }
                print("Service ID does not exist!")
            } else {
                var exist = false
                for service in serviceList {
                    if service.name
                        .lowercased()
                        .contains(keyword.lowercased()) {
                        exist = true
                        if service is Fitness {
                            let thisFitness = service as! Fitness
                            print(thisFitness.info)
                        } else {
                            let thisPersonal = service as! PersonalTraining
                            print(thisPersonal.info)
                        }
                    }
                }
                if exist {
                    return
                }
                print("Service does not exist!")
            }
        }
        
    }
    
    func beginMemberAction() {
        while true {
            print()
            print("Hi, please select an option to continue to the services:")
            print("     1. Input member ID")
            print("     2. Create membership")
            print("     3. Return")
            
            switch Utils.checkValidInput(range: 1...3) {
            case 3:
                return
            default:
                return
            }
        }
    }
}
