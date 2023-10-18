//
//  BackendEnvironment.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

enum BackendEnvironment: String {
    
    case pro
    case dev
    case pre
    
    var url: String {
        switch self {
        case .pro:
            return "https://pokeapi.co/"
        case .dev:
            return "https://pokeapi.co/"
        case .pre:
            return "https://pokeapi.co/"
        }
    }
}
