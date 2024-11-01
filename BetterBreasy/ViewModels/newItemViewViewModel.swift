//
//  newItemViewViewModel.swift
//  BetterBreasy
//
//  Created by erysmvn on 28/10/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class newItemViewViewModel: ObservableObject {
    @Published var number = ""
    @Published var type = ""

    @Published var showAlert = false
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // create a model
        let newId = UUID().uuidString // create unique ID
        // WARN: machines are not ordered by name, but by this ID
        let newItem = VendingMachineItem(
            id: newId,
            number: number,
            type: type
        )
        
        // save the model
        let db = Firestore.firestore()
        db.collection("machines")
            .document(newId)
            .setData(newItem.asDictionary()) // dictionary
    }
    
    var canSave: Bool {
        guard !number.trimmingCharacters(in: .whitespaces).isEmpty,
              !type.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
}
