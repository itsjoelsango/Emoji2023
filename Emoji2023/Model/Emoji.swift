//
//  Emoji.swift
//  Emoji2023
//
//  Created by Jo Michael on 4/14/23.
//

import Foundation

struct Emoji: Hashable {
    let id = UUID()
    let name: String
    let urlImage: String
    let description: String
    let backdrop: String
}
