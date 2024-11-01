//
//  Extensions.swift
//  BetterBreasy
//
//  Created by erysmvn on 27/10/24.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:] // empty dictionary
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
