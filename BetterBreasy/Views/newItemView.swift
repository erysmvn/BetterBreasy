//
//  newItemView.swift
//  BetterBreasy
//
//  Created by erysmvn on 28/10/24.
//

import SwiftUI

struct newItemView: View {
    @StateObject var viewModel = newItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var Types = ["Coffee", "Snacks", "Drinks"]
    @State private var selectedType = "Coffee"
    
    var body: some View {
        VStack {
            Spacer()
            Text("NEW MACHINE").font(.system(size: 30)).bold()
                .textFieldStyle(DefaultTextFieldStyle()).padding(.top, 100)
            
            Form {
                // title
                TextField("Number", text: $viewModel.number)
                // type
                VStack {
                    Picker("Type", selection: $selectedType) {
                        ForEach(Types, id: \.self) { //Type in
                            //Text(Types.rawValue.capitalized)
                            Text($0)
                        }
                    }
                }
                .pickerStyle(.segmented)
                // button
                ButtonForms(title: "Save",
                            background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }.padding()
            }.scrollContentBackground(.hidden)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"),
                          message: Text("please fill in all fields.")
                    )
                }
        }
    }
}

#Preview {
    newItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
