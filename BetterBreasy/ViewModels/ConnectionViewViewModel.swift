//
//  ConnectionViewViewModel.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import Foundation

class ConnectionViewViewModel: ObservableObject {
    @Published var showingConnection = false
    
    init() {}
    
    var canBuy : Bool {
        // check if balance is != to 0.00 $
        // check if num of digits is == 2
        return true
    }
}
