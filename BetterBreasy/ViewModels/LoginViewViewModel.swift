//
//  LoginViewViewModel.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errMsg = ""
    
    init() {}
    
    func login() {
        guard validate() else{
            return
        }
        // try loggin in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool { // not blank
        errMsg = "" // reset the error message value
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errMsg = "Please, fill in all fields."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errMsg = "Enter a valid email."
            return false
        }
        return true
    }
}
