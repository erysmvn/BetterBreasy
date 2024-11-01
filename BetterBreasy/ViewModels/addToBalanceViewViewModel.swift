//
//  addToBalanceViewViewModel.swift
//  BetterBreasy
//
//  Created by erysmvn on 30/10/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class addToBalanceViewViewModel: ObservableObject {
    @Published var cardID: String = "" 
    @Published var cardCVV: String = ""
    @Published var expMonth: String = ""
    @Published var expYear: String = ""
    @Published var howMuch: String = ""

    @Published var addingToBalanceView = false
    
    @Published var showAlert = false

    
    private let currentYear: Int
    private var currentYearLastTwoDigits: Int {
        return currentYear % 100
    }

    
    init() {
        self.currentYear = Calendar.current.component(.year, from: Date())
    }
    
    var canAdd: Bool {
        guard cardID.count == 16,
              cardCVV.count == 3,
              expMonth.count <= 2,
              expYear.count == 2 else {
            return false
        }
        if let expYearInt = Int(expYear) {
            if expYearInt < currentYearLastTwoDigits {
                return false
            }
        }
        if let expMonthInt = Int(expMonth) {
            if expMonthInt > 12 || expMonthInt < 1  {
                return false
            }
        }
        if let howMuchDouble = Double(howMuch) {
            if howMuchDouble <= 0.00 {
                return false
            }
        }
        return true
    }
    
    func add() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        if let howMuchDouble = Double(howMuch) {
            let db = Firestore.firestore()
            db.collection("users")
                .document(uid)
                .updateData([
                    "balance": FieldValue.increment(howMuchDouble)
                ]) { error in
                    if let error = error {
                        print("Error updating balance: \(error)") // debug
                    } else {
                        print("Balance successfully updated.") // debug
                    }
                }
        }
    }
}

