//
//  User.swift
//  BetterBreasy
//
//  Created by erysmvn on 26/10/24.
//

import Foundation

struct User: Codable {
    let id: String
    let username: String
    let email: String
    let joined: TimeInterval // when joined
}
