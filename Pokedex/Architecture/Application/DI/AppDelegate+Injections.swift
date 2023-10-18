//
//  AppDelegate+Injections.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

extension AppDelegate {
    
    func configureDependencyInjection() {
        _ = PokedexInjectorProvider.shared
            .add(PokedexModule.self)
    }
}
