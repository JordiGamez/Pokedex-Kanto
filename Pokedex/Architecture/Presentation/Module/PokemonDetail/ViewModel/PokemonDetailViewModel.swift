//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//

import Foundation

struct PokemonDetailViewModel {
    
    let pokemon: PokemonDetailCardViewModel
}

extension PokemonDetailViewModel {
    
    static func empty() -> Self {
        .init(pokemon: .empty())
    }
    
    static func mock() -> Self {
        .init(pokemon: .mock())
    }
}
