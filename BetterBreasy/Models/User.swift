//
//  User.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let username: String
    let email: String
    let superuser: Bool
    let balance: Float // how much on the app
    let joined: TimeInterval // when joined
}
