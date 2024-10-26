//
//  ContentView.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "folder")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("@erysmvn init")
        }
        .padding()
    }
}

#Preview {
    MainView()
}
