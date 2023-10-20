//
//  PokemonType.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//
// swiftlint:disable no_magic_numbers discouraged_none_name

import Foundation

struct PokemonType: Model {
    
    let name: PokemonTypeName
    let url: String
    
    var id: String {
        url.components(separatedBy: "/")[6]
    }
}

enum PokemonTypeName: String {
    case none
    case normal
    case grass
    case poison
    case fire
    case psychic
    case flying
    case ice
    case bug
    case rock
    case water
    case electric
    case ground
    case fairy
    case steel
    case fighting
    case dragon
    case ghost
}

// swiftlint:enable no_magic_numbers discouraged_none_name
