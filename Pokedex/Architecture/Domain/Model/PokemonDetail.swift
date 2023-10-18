//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//
// swiftlint:disable no_magic_numbers

import Foundation

struct PokemonDetail: Model {
    
    let id: Int
    let name: String
}

extension PokemonDetail {

    static func empty() -> PokemonDetail {
        .init(
            id: 0,
            name: ""
        )
    }
    
    static func mock() -> PokemonDetail {
        .init(
            id: 25,
            name: "pikachu"
        )
    }
}

// swiftlint:enable no_magic_numbers
