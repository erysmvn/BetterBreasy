//
//  ContentView.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color(hex: "#EAE0D5").ignoresSafeArea(.all)
    }
}

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // sign in state
            VendingMachinesView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        MainView()
    }
}
