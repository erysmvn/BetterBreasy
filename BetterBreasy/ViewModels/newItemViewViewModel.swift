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
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create a model
        let newId = UUID().uuidString
        let newItem = VendingMachineItem(
            id: newId,
            number: number,
            type: type
        )
        
        // save the model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("machines")
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
