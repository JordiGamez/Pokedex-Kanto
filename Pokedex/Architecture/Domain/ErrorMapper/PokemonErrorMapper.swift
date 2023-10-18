//
//  PokemonErrorMapper.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

struct PokemonErrorMapper {
    
    static func map(_ error: DataError) -> PokemonError {
        switch error {
        default:
            return .undefined
        }
    }
}
