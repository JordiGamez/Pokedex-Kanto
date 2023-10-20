//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//

import SwiftUI

struct PokemonDetailView<Presenter: PokemonDetailPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        ZStack {
            Theme.Color.surfaceContainerLow.ignoresSafeArea()
            switch presenter.screenState {
            case .loading:
                PokemonDetailSkeletonView()
            case .error:
                PokemonDetailErrorView<Presenter>()
            case .empty:
                PokemonDetailEmptyView()
            case .content:
                PokemonDetailContentView<Presenter>()
            }
            SwipeBackGestureRecognizer(onFire: presenter.goBack)
        }
        .toolbar(.backButton, title: "") { _ in
            presenter.goBack()
        }
        .onAppear { presenter.loadPokemonDetail() }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter: MockPokemonDetailPresenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        DevicesPreview {
            PokemonDetailView<MockPokemonDetailPresenter>()
                .environmentObject(presenter)
        }
    }
}
