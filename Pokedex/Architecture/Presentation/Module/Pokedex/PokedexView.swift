//
//  PokedexView.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct PokedexView<Presenter: PokedexPresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        ZStack {
            Theme.Color.surfaceContainerLow.ignoresSafeArea()
            switch presenter.screenState {
            case .loading:
                PokedexSkeletonView()
            case .error:
                PokedexErrorView<Presenter>()
            case .empty:
                PokedexEmptyView()
            case .content:
                PokedexContentView<Presenter>()
            }
        }
        .toolbar(.logo)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonList = Pokemon.mockList()
        let presenter: MockPokedexPresenter = MockPokedexPresenter(pokemonList: pokemonList)
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokedexView<MockPokedexPresenter>()
                    .environmentObject(presenter)
            }
        }
    }
}
