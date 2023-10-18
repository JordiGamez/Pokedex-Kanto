//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//
// swiftlint:disable no_magic_numbers

import Foundation

struct Pokemon: Model {
    
    let name: String
    let url: String
}

extension Pokemon {
    
    var number: String {
        url.components(separatedBy: "/")[6]
    }
    
    var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(number).png"
    }
}

extension Pokemon {
    
    static func empty() -> Self {
        .init(
            name: "",
            url: ""
        )
    }
    
    static func mock() -> Self {
        .init(
            name: "pikachu",
            url: "https://pokeapi.co/api/v2/pokemon/25/"
        )
    }
    
    static func mockList() -> [Self] {
        [
            .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
            .init(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
            .init(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
            .init(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
            .init(name: "charmeleon", url: "https://pokeapi.co/api/v2/pokemon/5/"),
            .init(name: "charizard", url: "https://pokeapi.co/api/v2/pokemon/6/"),
            .init(name: "squirtle", url: "https://pokeapi.co/api/v2/pokemon/7/"),
            .init(name: "wartortle", url: "https://pokeapi.co/api/v2/pokemon/8/"),
            .init(name: "blastoise", url: "https://pokeapi.co/api/v2/pokemon/9/")
        ]
    }
}

// swiftlint:enable no_magic_numbers
