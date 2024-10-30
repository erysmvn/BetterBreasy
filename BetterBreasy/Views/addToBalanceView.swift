//
//  addToBalanceView.swift
//  BetterBreasy
//
//  Created by erysmvn on 30/10/24.
//

import SwiftUI

struct addToBalanceView: View {
    var body: some View {
        @StateObject var viewModel = addToBalanceViewViewModel()
        //@Binding var addingToBalanceIsPresented: Bool
        
        Text("Add to balance view")
    }
}

#Preview {
    addToBalanceView()
}
