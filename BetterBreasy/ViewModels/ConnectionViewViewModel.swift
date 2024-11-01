//
//  ConnectionViewViewModel.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ConnectionViewViewModel: ObservableObject {
    @Published var itemNumber = ""
    @Published var currentBalance: Double = 0.00
    @Published var showAlert = false
    
    init() {}
    
    func buyItem() {
        // buy item
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .updateData([
                "balance": FieldValue.increment(Int64(-1))
            ]) { error in
                if let error = error {
                    print("Error updating balance: \(error)") // debug
                } else {
                    print("Balance successfully updated.") // debug
                }
            }
    }
}
