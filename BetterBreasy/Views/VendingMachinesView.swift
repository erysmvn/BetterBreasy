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
    
    @StateObject var userSigned = MainViewViewModel()
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/machines")
    }
    
    @State private var isPresentingConnection: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 20) {
                    ForEach(items) { item in
                        VStack {
                            if item.type == "Coffee" {
                                MachineItem(icon: "☕") {
                                    isPresentingConnection = true
                                }
                            } else if item.type == "Snacks" {
                                MachineItem(icon: "🍫") {
                                    isPresentingConnection = true
                                }
                            } else if item.type == "Drinks" {
                                MachineItem(icon: "🥤") {
                                    isPresentingConnection = true
                                }
                            }
                            Text(item.number).bold()
                                .font(.subheadline)
                                .font(.system(size: 60))
                            }
                        }
                    }.listStyle(PlainListStyle())
            }.navigationTitle("Available machines:")
            if userSigned.currentUserId == "gDTSC8vpmCS51lWwPi8ZedEEUQt2" { // superuser
                NavigationView{
                }.toolbar {
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: $viewModel.showingNewItemView) {
                    newItemView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }.sheet(isPresented: $isPresentingConnection) {
            ConnectionView(isPresentingConnection: $viewModel.showingConnection)
        }
    }
}

#Preview {
    VendingMachinesView(userId: "gDTSC8vpmCS51lWwPi8ZedEEUQt2")
}
 
