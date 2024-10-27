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
    var body: some View {
        NavigationView {
            LoginView().navigationTitle("Better-Breasy☕")
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        MainView()
    }
}
