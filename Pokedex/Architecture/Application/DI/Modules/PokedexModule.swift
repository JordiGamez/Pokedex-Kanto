//
//  PokedexModule.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//
// swiftlint:disable force_unwrapping

import Foundation
import Swinject

class PokedexModule: InjectorModule {
    
    override func configure(_ container: Container) {
        configurePokedex(container)
        configurePokemonDetail(container)
    }
    
    private func configurePokedex(_ container: Container) {
        container.register(PokemonRemoteDataSource.self) { _ in
            PokemonRemoteDataSourceDefault()
        }
        .inObjectScope(.container)
        
        container.register(PokemonRepository.self) { r in
            PokemonRepositoryDefault(
                remoteDataSource: r.resolve(PokemonRemoteDataSource.self)!
            )
        }
        .inObjectScope(.container)
        
        container.register(GetPokemonListInteractor.self) { r in
            GetPokemonListInteractorDefault(
                repository: r.resolve(PokemonRepository.self)!
            )
        }
        .inObjectScope(.container)
    }
    
    private func configurePokemonDetail(_ container: Container) {
        container.register(GetPokemonDetailInteractor.self) { r in
            GetPokemonDetailInteractorDefault(
                repository: r.resolve(PokemonRepository.self)!
            )
        }
        .inObjectScope(.container)
    }
}

// swiftlint:enable force_unwrapping
