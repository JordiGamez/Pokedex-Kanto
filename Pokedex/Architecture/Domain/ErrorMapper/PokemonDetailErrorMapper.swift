//
//  PokemonDetailErrorMapper.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

struct PokemonDetailErrorMapper {
    
    static func map(_ error: DataError) -> PokemonDetailError {
        switch error {
        default:
            return .undefined
        }
    }
}
