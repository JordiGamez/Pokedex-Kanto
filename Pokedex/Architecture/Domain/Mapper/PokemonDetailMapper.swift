//
//  PokemonDetailMapper.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

struct PokemonDetailMapper {
    
    static func map(_ entity: PokemonDetailEntity) -> PokemonDetail {
        .init(
            id: entity.id ?? 0,
            name: entity.name ?? ""
        )
    }
}
