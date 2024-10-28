//
//  ProfileView.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }.navigationTitle("Welcome back, \(viewModel)") // \(viewModel.username)
        }
    }
}

#Preview {
    ProfileView()
}
