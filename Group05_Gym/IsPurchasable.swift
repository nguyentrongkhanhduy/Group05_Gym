//
//  IsPurchasable.swift
//  Group05_Gym
//
//  Created by Eddie Nguyen on 2025-01-16.
//

import Foundation

protocol IsPurchasable {
    var info: String { get }
    func printReceipt(type: String, member: Member)
}
