//
//  PokemonViewModelMapper.swift
//  Pokedex
//
//  Created by Jordi Gámez on 19/10/23.
//

import Foundation

struct PokemonViewModelMapper {
    
    static func map(_ pokemonList: [Pokemon]) -> PokemonViewModel {
        .init(
            pokemon: pokemonList.map {
                .init(
                    number: $0.number,
                    name: $0.name,
                    imageURL: $0.imageURL
                )
            }
        )
    }
}
