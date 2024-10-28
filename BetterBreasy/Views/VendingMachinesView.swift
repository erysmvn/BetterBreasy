//
//  VendingMachinesView.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import SwiftUI

struct VendingMachinesView: View {
    @StateObject var viewModel = ListViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }.navigationTitle("List")
                .toolbar {
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: $viewModel.showingNewItemView) {
                    newItemView(newItemPresented: $viewModel.showingNewItemView)
                }
        }
    }
}

#Preview {
    VendingMachinesView(userId: "") 
}
 
