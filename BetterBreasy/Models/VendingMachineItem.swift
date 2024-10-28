//
//  VendingMachineItem.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import Foundation

struct VendingMachineItem: Codable, Identifiable {
    let id: String
    let number: String
    let type: String
}
