//
//  LoginView.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import SwiftUI

// color hex code
extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

struct LoginView: View {
    init() {
        // Customize appearance
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.gray]
        
        // Apply appearance settings
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Login Here:")
                        .font(.system(size: 50))
                        .bold()
                        .padding(.bottom, 2)
                    Text("Better-Breasy")
                        .font(.system(size: 25))
                        .bold()
                        .opacity(0.60)
                        .padding(.bottom, 10)
                    Spacer()
                    // login form
                    Form {
                        if !viewModel.errMsg.isEmpty {
                            Text(viewModel.errMsg).foregroundColor(Color.red)
                        }
                        Spacer()
                        TextField("Email", text: $viewModel.email).textFieldStyle(.roundedBorder).autocapitalization(.none).autocorrectionDisabled()
                        
                        SecureField("Password", text: $viewModel.password).textFieldStyle(.roundedBorder)
                        
                        // re-usable button
                        ButtonForms(title: "Log in", background: .blue){
                            viewModel.login()
                        }.padding()
                    }.scrollContentBackground(.hidden)
                    
                    /*
                    if let image = UIImage(named: "pngIcon") {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 160, height: 160)
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Text("Image not found")
                    }
                    */ // i have some problems with sys keyboard casting
                    
                    // create account
                    VStack {
                        Text("Don't have an acc yet?")
                        NavigationLink("Register here", destination: RegisterView()) // jump to register form
                    }.padding(.bottom, 15)
                }.padding(.top, 180)
            }
        }
    }
}

#Preview {
    LoginView()
}
