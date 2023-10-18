//
//  PokemonListEntity.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

struct PokemonListEntity: Entity {
    
    let count: Int?
    let results: [PokemonEntity]
}
