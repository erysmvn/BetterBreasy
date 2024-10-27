//
//  RegisterView.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import SwiftUI


struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Form {
                    Spacer()
                    TextField("Username", text: $viewModel.username).textFieldStyle(.roundedBorder).autocapitalization(.none).autocorrectionDisabled()
                    TextField("Email", text: $viewModel.email).textFieldStyle(.roundedBorder).autocapitalization(.none).autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password).textFieldStyle(.roundedBorder)
                    
                    // re-usable button
                    ButtonForms(title: "Register", background: .green){
                        viewModel.register()
                    }.padding()
                }.scrollContentBackground(.hidden)
                Spacer().navigationTitle("Better-Breasy☕")
            }.padding(.top, 140)
        }
    }
}

#Preview {
    RegisterView()
}
