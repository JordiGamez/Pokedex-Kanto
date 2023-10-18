//
//  GetPokemonDetailInteractor.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Combine

// sourcery: AutoMockable
protocol GetPokemonDetailInteractor {
    func execute(id: String) -> AnyPublisher<PokemonDetail, PokemonDetailError>
}

final class GetPokemonDetailInteractorDefault {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
}

extension GetPokemonDetailInteractorDefault: GetPokemonDetailInteractor {
    
    func execute(id: String) -> AnyPublisher<PokemonDetail, PokemonDetailError> {
        repository.getPokemonDetail(id: id)
            .map { PokemonDetailMapper.map($0) }
            .mapError { PokemonDetailErrorMapper.map($0) }
            .eraseToAnyPublisher()
    }
}
