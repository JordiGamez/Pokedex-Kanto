//
//  PokemonTypeBadgeViewModel.swift
//  Pokedex
//
//  Created by Jordi Gámez on 19/10/23.
//

import SwiftUI

struct PokemonTypeBadgeViewModel {
    
    let typeName: PokemonTypeName
    
    var typeNameFormated: String {
        typeName.rawValue.uppercased()
    }
    
    var backgroundColor: Color {
        switch typeName {
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
