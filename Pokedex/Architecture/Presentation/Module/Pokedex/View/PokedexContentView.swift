//
//  PokedexContentView.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct PokedexContentView<Presenter: PokedexPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        ScrollView {
            VStack(spacing: Theme.Spacing.space_3) {
                ForEach(presenter.pokemonList, id: \.number) { pokemon in
                    PokemonCard(
                        viewModel: .init(
                            number: pokemon.number,
                            name: pokemon.name,
                            imageURL: pokemon.imageURL
                        ),
                        onTap: {
                            presenter.loadPokemonDetail(id: pokemon.number)
                        }
                    )
                    .accessibilityIdentifier(Accessibility.Identifiers.Pokedex.pokemon)
                }
            }
            .padding(.all, Theme.Spacing.space_2)
        }
    }
}

struct PokedexContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonList = [Pokemon.mock()]
        let presenter: MockPokedexPresenter = MockPokedexPresenter(pokemonList: pokemonList)
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokedexContentView<MockPokedexPresenter>()
                    .environmentObject(presenter)
            }
        }
    }
}
