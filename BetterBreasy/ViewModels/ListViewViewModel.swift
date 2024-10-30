//
//  ListViewViewModel.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import Foundation


/// new model for list of item view
/// primary tab
class ListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    @Published var showingConnection = false
    
    init() {}
}

