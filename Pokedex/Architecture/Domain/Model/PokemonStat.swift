//
//  PokemonStat.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//

import Foundation

struct PokemonStat: Model {
    
    let name: String
    let value: Int
    
    var nameFormated: String {
        name.replacingOccurrences(of: "-", with: " ")
    }
}
