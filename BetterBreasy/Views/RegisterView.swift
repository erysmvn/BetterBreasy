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
                Text("Register Here:")
                    .font(.system(size: 50))
                    .bold()
                    .padding(.bottom, 2)
                Text("Better-Breasy")
                    .font(.system(size: 25))
                    .bold()
                    .opacity(0.60)
                    .padding(.bottom, 10)
                Spacer()
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
                
                if let image = UIImage(named: "pngIcon") {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 160, height: 160)
                                .aspectRatio(contentMode: .fit)
                        } else {
                            Text("Image not found")
                        }

            }.padding(.top, 140)
        }
    }
}

#Preview {
    RegisterView()
}
