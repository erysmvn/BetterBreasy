//
//  BetterBreasyApp.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import FirebaseCore
import SwiftUI

@main
struct BetterBreasyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
