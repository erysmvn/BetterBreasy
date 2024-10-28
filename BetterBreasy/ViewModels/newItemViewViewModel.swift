//
//  newItemViewViewModel.swift
//  BetterBreasy
//
//  Created by erysmvn on 28/10/24.
//

import Foundation

class newItemViewViewModel: ObservableObject {
    @Published var number = ""
    @Published var type = ""
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !number.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
}
