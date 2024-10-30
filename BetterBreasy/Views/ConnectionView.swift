//
//  ConnectionView.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import SwiftUI

struct ConnectionView: View {
    @StateObject var viewModel = ConnectionViewViewModel()
    @Binding var isPresentingConnection: Bool
    
    @State private var currentNum: String = ""
    
    var body: some View {
        VStack {
            Text((currentNum.isEmpty ? "  " : currentNum)) // so even if it's empty it will have the same padding
                .font(.system(size: 50))
            HStack {
                ConnItem(number: "1") {
                    if currentNum.count < 2 {
                        currentNum = currentNum + "1"
                    }
                }
                ConnItem(number: "2") {
                    if currentNum.count < 2 {
                        currentNum = currentNum + "2"
                    }
                }
                ConnItem(number: "3") {
                    if currentNum.count < 2 {
                        currentNum = currentNum + "3"
                    }
                }
            }
            
            HStack {
                ConnItem(number: "4") {
                    if currentNum.count < 2 {
                        currentNum = currentNum + "4"
                    }
                }
                ConnItem(number: "5") {
                    if currentNum.count < 2 {
                        currentNum = currentNum + "5"
                    }
                }
                ConnItem(number: "6") {
                    if currentNum.count < 2 {
                        currentNum = currentNum + "6"
                    }
                }
            }
            
            HStack {
                ConnItem(number: "7") {
                    if currentNum.count < 2 {
                        currentNum = currentNum + "7"
                    }
                }
                ConnItem(number: "8") {
                    if currentNum.count < 2 {
                        currentNum = currentNum + "8"
                    }
                }
                ConnItem(number: "9") {
                    if currentNum.count < 2 {
                        currentNum = currentNum + "9"
                    }
                }
            }
            
            HStack {
                ConnItemSpecial(number: "✓", textSize: 35, background: .green) {
                    // check if can buy
                    // set balance to 0
                    isPresentingConnection = false
                }
                ConnItem(number: "0") {
                    if currentNum.count < 2 {
                        currentNum = currentNum + "0"
                    }
                }
                ConnItemSpecial(number: "⌫", textSize: 33, background: .red) {
                    if !currentNum.isEmpty {
                        currentNum.removeLast()
                    }
                }
            }
        }.padding(.top, 30)
    }
}

#Preview {
    ConnectionView(isPresentingConnection: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
