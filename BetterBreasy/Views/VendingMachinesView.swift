//
//  VendingMachinesView.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import SwiftUI
import FirebaseFirestore // FirebaseFirestoreSwift?

struct VendingMachinesView: View {
    @StateObject var viewModel = ListViewViewModel()
    @FirestoreQuery var items: [VendingMachineItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/machines")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 20) {
                    ForEach(items) { item in
                        VStack {
                            if item.type == "Coffee" {
                                MachineItem(icon: "☕") {
                                    
                                }
                            } else if item.type == "Snacks" {
                                MachineItem(icon: "🍫") {
                                    
                                }
                            } else if item.type == "Drinks" {
                                MachineItem(icon: "🥤") {
                                    
                                }
                            }
                            Text(item.number).bold()
                                .font(.subheadline)
                                .font(.system(size: 60))
                            }
                        }
                    }.listStyle(PlainListStyle())
            }.navigationTitle("Available machines:")
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
    VendingMachinesView(userId: "gDTSC8vpmCS51lWwPi8ZedEEUQt2")
}
 
