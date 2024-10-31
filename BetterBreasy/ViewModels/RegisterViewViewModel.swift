//
//  RegisterViewViewModel.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errMsg = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in // weak reference to self
            guard let userId = result?.user.uid else {
                return
            }
            // weak reference to self that prevent self from being deallocated
            // if self is deallocated while the closure is still trying to access it, the reference will become 'nil'
            self?.insertUserRecord(id: userId) // self? is called "self optional"
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           username: username,
                           email: email,
                           superuser: false,
                           balance: 0.00,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
