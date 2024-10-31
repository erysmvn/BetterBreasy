//
//  ConnectionViewViewModel.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import Foundation

class ConnectionViewViewModel: ObservableObject {
    @Published var itemNumber = ""
    @Published var currentBalance: Double = 0.00
    @Published var showAlert = false
    
    init() {}
    
    func buyItem() {
        // buy item
    }
}
