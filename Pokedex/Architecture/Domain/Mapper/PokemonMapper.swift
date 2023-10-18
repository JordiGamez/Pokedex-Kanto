//
//  PokemonMapper.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

struct PokemonMapper {
    
    static func map(_ entity: PokemonEntity) -> Pokemon {
        .init(
            name: entity.name ?? "",
            url: entity.url ?? ""
        )
    }
}
