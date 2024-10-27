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

    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack {
            // login form
            
            Form {
                TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    // log in
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                        Text("Log in").bold().foregroundColor(Color.white)
                    }
                }
            }.foregroundColor(Color(hex: "#EAE0D5"))
            
            // create account
            VStack {
                Text("Don't have an acc yet?")
                Button("Register here") {
                    // jump to registration form
                }
            }.padding(.bottom, 15)
            Spacer()
        }.padding(.top, 50)
    }
}

#Preview {
    LoginView()
}
