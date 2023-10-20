//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Jordi Gámez on 19/10/23.
//

import Foundation

struct PokemonViewModel {
    
    let pokemon: [PokemonCardViewModel]
}

extension PokemonViewModel {
    
    static func empty() -> Self {
        .init(pokemon: [])
    }
}
