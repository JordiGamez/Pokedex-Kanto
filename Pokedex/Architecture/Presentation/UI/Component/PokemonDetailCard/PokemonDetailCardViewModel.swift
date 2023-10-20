//
//  PokemonDetailCardViewModel.swift
//  Pokedex
//
//  Created by Jordi Gámez on 19/10/23.
//
// swiftlint:disable no_magic_numbers

import SwiftUI

struct PokemonDetailCardViewModel {
    
    let number: Int
    let name: String
    let imageURL: String
    let types: [PokemonTypeDetailCardViewModel]
    let height: Float
    let weight: Float
    let stats: [PokemonStatDetailCardViewModel]
    
    var backgroundColor: Color {
        types.first?.color ?? Theme.Color.PokemonType.typeNone
    }
    
    var numberFormated: String {
        String(format: "%03d", number)
    }
}

struct PokemonTypeDetailCardViewModel {
    
    let name: PokemonTypeName
    let url: String
    
    var id: String {
        url.components(separatedBy: "/")[6]
    }
    
    var color: Color {
        switch name {
        case .none:
            return Theme.Color.PokemonType.typeNone
        case .normal:
            return Theme.Color.PokemonType.typeNormal
        case .grass:
            return Theme.Color.PokemonType.typeGrass
        case .poison:
            return Theme.Color.PokemonType.typePoison
        case .fire:
            return Theme.Color.PokemonType.typeFire
        case .psychic:
            return Theme.Color.PokemonType.typePsychic
        case .flying:
            return Theme.Color.PokemonType.typeFlying
        case .ice:
            return Theme.Color.PokemonType.typeIce
        case .bug:
            return Theme.Color.PokemonType.typeBug
        case .rock:
            return Theme.Color.PokemonType.typeRock
        case .water:
            return Theme.Color.PokemonType.typeWater
        case .electric:
            return Theme.Color.PokemonType.typeElectric
        case .ground:
            return Theme.Color.PokemonType.typeGround
        case .fairy:
            return Theme.Color.PokemonType.typeFairy
        case .steel:
            return Theme.Color.PokemonType.typeSteel
        case .fighting:
            return Theme.Color.PokemonType.typeFighting
        case .dragon:
            return Theme.Color.PokemonType.typeDragon
        case .ghost:
            return Theme.Color.PokemonType.typeGhost
        }
    }
}

struct PokemonStatDetailCardViewModel {
    
    let name: String
    let value: Int
    
    var nameFormated: String {
        name.replacingOccurrences(of: "-", with: " ")
    }
}

extension PokemonDetailCardViewModel {
    
    static func empty() -> Self {
        .init(
            number: 0,
            name: "",
            imageURL: "",
            types: [],
            height: 0,
            weight: 0,
            stats: []
        )
    }
    
    static func mock() -> Self {
        .init(
            number: 25,
            name: "Pikachu",
            imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
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
