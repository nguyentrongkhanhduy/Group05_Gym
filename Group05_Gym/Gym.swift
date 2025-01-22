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
    
    var membershipList: [Member] = [
        Member(id: 0, name: "Eddie", bookedService: [
            Fitness(
            id: 1,
            name: "Full Body Cardio",
            totalSession: 3,
            price: 30.0,
            duration: 30
            )
        ])
    ]
    
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
                print("Exiting the gym... See you again!")
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
            print("     2. Search service")
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
        print()
        print("Please select service type")
        print("     1. Fitness Class")
        print("     2. Personal Training")
        print("     3. Return")
        
        switch Utils.checkValidInput(range: 1...3) {
        case 1:
            addFitnessClass()
        case 2:
            addPersonalTraining()
        case 3:
            return
        default:
            return
        }
    }
    
    func addFitnessClass() {
        while true {
            print()
            print("Please create an ID for the service:")
            let newId = Utils.checkInputInt()
            if Utils
                .checkServiceExisted(serviceList: self.serviceList, id: newId) {
                continue
            }
            if newId == -1 {
                print("Please enter valid input.")
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
            let newId = Utils.checkInputInt()
            if Utils
                .checkServiceExisted(serviceList: self.serviceList, id: newId) {
                continue
            }
            if newId == -1 {
                print("Please enter valid input.")
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
    
    func beginMemberAction() {
        while true {
            print()
            print("Hi, please select an option to continue to the services:")
            print("     1. Login by member ID")
            print("     2. Create membership")
            print("     3. Return")
            
            switch Utils.checkValidInput(range: 1...3) {
            case 1:
                if memberLogin() {
                    continue
                }
            case 2:
                createMember()
            case 3:
                return
            default:
                return
            }
        }
    }
    
    func memberLogin() -> Bool {
        print()
        print("Please enter your member ID:")
        let inputId = Utils.checkInputInt()
        if !Utils
            .checkMemberExisted(membershipList: self.membershipList, id: inputId) {
            print("member ID: \(inputId) not found, please try again or create a new membership")
            return false
        }
        if memberMenu(memberId:inputId) {
            return true // Indicate to restart beginMemberAction
        } else {
            return false // Exit to beginMemberAction
        }
    }
    
    func memberMenu(memberId: Int) -> Bool {
        while true {
            guard let member = self.membershipList.first(where: { $0.id == memberId }) else {
                print("Member not found.")
                return true
            }
            // Print member info
            print()
            print(member.getMemberInfo())
            print()
            
            // Display menu options
            print("Hi \(member.name), please select an option to continue to the services:")
            print("     1. Check my credit points")
            print("     2. Reload credit points")
            print("     3. Searching for service")
            print("     4. Purchase service")
            print("     5. Manage my service")
            print("     6. Logout")
            
            switch Utils.checkValidInput(range: 1...6) {
            case 1:
                print("\nYour Credit Balance is:\(member.getBalance())")
            case 2:
                reloadCredit(memberId: memberId)
            case 3:
                searchService()
                print("\nPress Enter to continue...")
                _ = readLine()
            case 4:
                purchaseService(memberId: memberId)
            case 5:
                if member.getBookedService().count == 0 {
                    Utils.printWithEnter("\nYou have no booked service yet.")
                } else {
                    manageMyServices(memberId: memberId)
                }
            case 6:
                return true
            default :
                return true
            }
        }
    }
    
    func reloadCredit(memberId: Int) {
        let member = self.membershipList.first(where: { $0.id == memberId })!
        print("Hi \(member.name), Please enter the amount you want to reload:")
        let inputAmount = Utils.checkInputDouble()
        if self.membershipList.first(where: { $0.id == memberId })!.deposit(amount: inputAmount){
            print("deposit successful")
        }
    }
    
    func purchaseService(memberId: Int) {
        while true {
            let member = self.membershipList.first(where: { $0.id == memberId })!
            print()
            print("Hi \(member.name), please select your action:")
            print("     1. View all services")
            print("     2. Book a service")
            print("     3. Return")
            
            switch Utils.checkValidInput(range: 1...3) {
            case 1:
                printAllServices()
            case 2:
                purchaseServiceBynameOrId(memberId: memberId)
            case 3:
                return
            default:
                return
            }
        }
    }
    
    func purchaseServiceBynameOrId(memberId: Int) {
        print()
        print("Please enter Service ID:")
        let serviceId = Utils.checkInputInt()
        for service in serviceList {
            if service.id == serviceId {
                print(service.info)
                purchaseAction(memberId: memberId, service: service)
                return
            }
        }
        Utils.printWithEnter("Service ID does not exist!")

    }
    
    func purchaseAction(memberId: Int, service: Service){
        while true{
            print()
            print("please select your action:")
            print("     1. confirm purchase")
            print("     2. Return")
            
            switch Utils.checkValidInput(range: 1...2) {
            case 1:
                self.membershipList.first(where: { $0.id == memberId })!.bookService(service)
                return
            case 2:
                return
            default:
                return
            }
        }
    }
    
    func manageMyServices(memberId: Int){
        while true{
            print()
            print("please select your action:")
            print("     1. make attendance for booked service")
            print("     2. cancel booked service")
            print("     3. View my booked service")
            print("     4. return")
            let member = self.membershipList.first(where: { $0.id == memberId })!
            switch Utils.checkValidInput(range: 1...4) {
            case 1:
                if member.getBookedService().count == 0 {
                    Utils.printWithEnter("\nYou don't have any service booked yet.")
                } else {
                    member.makeAttendance()
                }
                return
            case 2:
                if member.getBookedService().count == 0 {
                    Utils.printWithEnter("\nYou don't have any service booked yet.")
                } else {
                    member.cancelService()
                }
                return
            case 3:
                let services = member.getBookedService()
                if services.count == 0 {
                    Utils.printWithEnter("\nYou don't have any service booked yet.")
                } else {
                    print("\nYour booked services:")
                    for service in services {
                        print(service.info)
                        print("Attended sessions: \(service.attendedSession)\n")
                    }
                    print("\nPress Enter to continue...")
                    _ = readLine()
                }
                return
            case 4:
                return
            default:
                return
            }
        }
    }
    
    func createMember() {
        print()
        print("=== Create a New Membership ===")
        print("Enter your name:")
        let name = Utils.checkInputString()
        
        // Create a new member instance
        let newMember = Member(name: name)
        if !Utils.checkMemberExisted(membershipList: self.membershipList, id: newMember.id) {
            // Add the new member to the list
            self.membershipList.append(newMember)
            print()
            print("Membership created successfully!")
            print(newMember.getMemberInfo())
        } else {
            Utils.printWithEnter("Member id already exists!")
        }
    }
}
