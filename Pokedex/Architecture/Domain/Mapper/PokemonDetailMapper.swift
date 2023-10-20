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
            number: entity.id ?? 0,
            name: entity.name ?? "",
            imageUrl: entity.sprites?.other.artwork.frontDefault ?? "",
            types: entity.types.map({ mapType($0.type) }),
            height: entity.height ?? 0,
            weight: entity.weight ?? 0,
            stats: entity.stats.map({ mapStat($0) })
        )
    }
}

private extension PokemonDetailMapper {
    
    static func mapType(_ entity: PokemonTypeEntity) -> PokemonType {
        .init(
            name: PokemonTypeName(rawValue: entity.name.rawValue) ?? .none,
            url: entity.url
        )
    }
    
    static func mapStat(_ entity: PokemonStatsEntity) -> PokemonStat {
        .init(
            name: entity.stat.name,
            value: entity.value
        )
    }
}
