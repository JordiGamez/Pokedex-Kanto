//
//  GetPokemonInteractor.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Combine

// sourcery: AutoMockable
protocol GetPokemonListInteractor {
    func execute(region: PokemonRegion) -> AnyPublisher<[Pokemon], PokemonError>
}

final class GetPokemonListInteractorDefault {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
}

extension GetPokemonListInteractorDefault: GetPokemonListInteractor {
    
    func execute(region: PokemonRegion) -> AnyPublisher<[Pokemon], PokemonError> {
        repository.getPokemonList(region: region)
            .map { $0.results.map { PokemonMapper.map($0) } }
            .mapError { PokemonErrorMapper.map($0) }
            .eraseToAnyPublisher()
    }
}
