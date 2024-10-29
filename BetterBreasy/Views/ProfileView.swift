//
//  ProfileView.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import SwiftUI
import FirebaseFirestore // FirebaseFirestoreSwift?

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Spacer()
                    Image(systemName: "person.circle").resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    VStack {
                        HStack {
                            Text("Joined: ").bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                    }.navigationTitle("Hello, \(user.username)")
                    Button("Log out") {
                        viewModel.logOut()
                    }.tint(.red).padding()
                    Spacer()
                } else {
                    Text("Loading profile...")
                }
            }
        }.onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
