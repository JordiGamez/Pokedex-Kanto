//
//  PokemonDetailViewModelMapper.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//

import Foundation

struct PokemonDetailViewModelMapper {
    
    static func map(_ pokemonDetail: PokemonDetail) -> PokemonDetailViewModel {
        .init(
            pokemon: .init(
                number: pokemonDetail.number,
                name: pokemonDetail.name,
                imageURL: pokemonDetail.imageUrl,
                types: mapTypes(pokemonDetail.types),
                height: pokemonDetail.height,
                weight: pokemonDetail.weight,
                stats: mapStats(pokemonDetail.stats)
            )
        )
    }
}

private extension PokemonDetailViewModelMapper {
    
    static func mapTypes(_ pokemonTypes: [PokemonType]) -> [PokemonTypeDetailCardViewModel] {
        pokemonTypes.map { PokemonTypeDetailCardViewModel(name: $0.name, url: $0.url) }
    }
    
    static func mapStats(_ pokemonStats: [PokemonStat]) -> [PokemonStatDetailCardViewModel] {
        pokemonStats.map { PokemonStatDetailCardViewModel(name: $0.name, value: $0.value) }
    }
}
