//
//  PokemonDetailContentView.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//

import SwiftUI

struct PokemonDetailContentView<Presenter: PokemonDetailPresenter>: View {
    
    private let avatarSize: CGFloat = 90
    private let rowSizeHeight: CGFloat = 64
    private let imagePlaceholderOpacity: CGFloat = 0.5
    private let backgroundImageSize: CGFloat = 150
    private let backgroundImageXOffset: CGFloat = 35
    private let backgroundImageYOffset: CGFloat = 15
    private let backgroundImageOpacity: CGFloat = 0.22
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        PokemonDetailCard(viewModel: presenter.pokemonDetail.pokemon)
    }
}

struct PokemonDetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter: MockPokemonDetailPresenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        DevicesPreview {
            PokemonDetailContentView<MockPokemonDetailPresenter>()
                .environmentObject(presenter)
        }
    }
}
