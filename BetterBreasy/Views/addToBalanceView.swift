//
//  addToBalanceView.swift
//  BetterBreasy
//
//  Created by erysmvn on 30/10/24.
//

import SwiftUI

struct addToBalanceView: View {
    @StateObject var viewModel = addToBalanceViewViewModel()
    @Binding var isPresentingBalance: Bool
    
    @State private var save: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Add card information")
                .font(.title2)
                .padding()
                .padding(.top, 20)
            
            Form {
                Spacer()
                VStack {
                    Spacer()
                    HStack {
                        TextField("0.00 ", text: $viewModel.howMuch)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.numberPad) // idk why but firebase ignores float values atm, i'll prob change my db
                        Text("€")
                            .foregroundColor(.secondary)
                    }.padding()
                    Spacer()
                    TextField("Card ID", text: $viewModel.cardID)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    HStack {
                        HStack {
                            TextField("MM", text: $viewModel.expMonth)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                            TextField("YY", text: $viewModel.expYear)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                        }
                        TextField("Card CVV", text: $viewModel.cardCVV)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }
                    ButtonForms(title: "Add", background: .blue) {
                        if viewModel.canAdd {
                            viewModel.add()
                            isPresentingBalance = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }.padding()
                }
            }.scrollContentBackground(.hidden).padding(.top, 30)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"),
                          message: Text("please fill in all fields.")
                    )
                }
            Spacer()
        }
    }
}


#Preview {
    addToBalanceView(isPresentingBalance: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
