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
    
    @StateObject var userSigned =  ProfileViewViewModel()
    var isSuperUser: Bool {
        return userSigned.user?.superuser ?? false
    }
    
    init() {
        self._items = FirestoreQuery(collectionPath: "machines")
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
                                    viewModel.showingConnection = true // use this one on the model file, it cant be private!!!!!
                                }
                            } else if item.type == "Snacks" {
                                MachineItem(icon: "🍫") {
                                    viewModel.showingConnection = true
                                }
                            } else if item.type == "Drinks" {
                                MachineItem(icon: "🥤") {
                                    viewModel.showingConnection = true
                                }
                            }
                            Text(item.number).bold()
                                .font(.subheadline)
                                .font(.system(size: 60))
                            }
                        }
                    }.listStyle(PlainListStyle())
            }.navigationTitle("Available machines:")
                .onAppear {
                    userSigned.fetchUser()
                }
                .toolbar {
                if isSuperUser { // only SuperUsers can add machhines
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                }.sheet(isPresented: $viewModel.showingNewItemView) {
                    newItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }.sheet(isPresented: $viewModel.showingConnection) {
            ConnectionView(isPresentingConnection: $viewModel.showingConnection)
        }
    }
}

#Preview {
    VendingMachinesView()
}
 
