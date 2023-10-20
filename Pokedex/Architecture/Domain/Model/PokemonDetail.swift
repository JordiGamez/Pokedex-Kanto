//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//
// swiftlint:disable no_magic_numbers

import Foundation

struct PokemonDetail: Model {
    
    let number: Int
    let name: String
    let imageUrl: String
    let types: [PokemonType]
    let height: Float
    let weight: Float
    let stats: [PokemonStat]
}

extension PokemonDetail: Equatable {
    
    static func == (lhs: PokemonDetail, rhs: PokemonDetail) -> Bool {
        lhs.number == rhs.number
    }
}

extension PokemonDetail {
    
    var isEmpty: Bool {
        number == 0
    }
}

extension PokemonDetail {
    
    static func empty() -> PokemonDetail {
        .init(
            number: 0,
            name: "",
            imageUrl: "",
            types: [],
            height: 0,
            weight: 0,
            stats: []
        )
    }
    
    static func mock() -> PokemonDetail {
        .init(
            number: 25,
            name: "pikachu",
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
            types: [.init(name: .electric, url: "https://pokeapi.co/api/v2/type/13/")],
            height: 4,
            weight: 60,
            stats: [
                .init(name: "speed", value: 10),
                .init(name: "speed", value: 20),
                .init(name: "speed", value: 30),
                .init(name: "speed", value: 40),
                .init(name: "speed", value: 50),
                .init(name: "speed", value: 60)
            ]
        )
    }
}

// swiftlint:enable no_magic_numbers
