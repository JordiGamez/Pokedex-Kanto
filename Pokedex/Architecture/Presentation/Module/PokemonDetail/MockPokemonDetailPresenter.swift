//
//  MockPokemonDetailPresenter.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//

import Foundation

final class MockPokemonDetailPresenter: PokemonDetailPresenter {
    
    var screenState: PokemonDetailScreenState = .loading
    var pokemonDetail: PokemonDetailViewModel = .mock()
    
    init(pokemonDetail: PokemonDetailViewModel) {
        self.pokemonDetail = pokemonDetail
    }
    
    func loadPokemonDetail() {
        // Intentionally empty
    }
    
    func goBack() {
        // Intentionally empty
    }
}
