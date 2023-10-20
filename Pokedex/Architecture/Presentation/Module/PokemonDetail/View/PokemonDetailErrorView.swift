//
//  PokemonDetailErrorView.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//

import SwiftUI

struct PokemonDetailErrorView<Presenter: PokemonDetailPresenter>: View {
    
    private let iconSize: CGFloat = 24
    private let iconCircleSize: CGFloat = 64
    private let textHorizontalPadding: CGFloat = 80
    private let buttonWidth: CGFloat = 212
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        VStack(spacing: Theme.Spacing.space_2) {
            icon
            explanation
            button
        }
    }
    
    var icon: some View {
        ZStack {
            Theme.Color.onPrimary
                .frame(width: iconCircleSize, height: iconCircleSize)
                .clipShape(Circle())
            Image(Assets.icon.exclamation)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Theme.Color.error)
                .frame(width: iconSize, height: iconSize)
        }
        .padding(.bottom, Theme.Spacing.space_2)
    }
    
    var explanation: some View {
        Text(Strings.pokemonDetailError)
            .font(Theme.Font.body1)
            .foregroundColor(Theme.Color.onBackground)
            .multilineTextAlignment(.center)
            .padding(.horizontal, Theme.Spacing.space_10)
            .padding(.bottom, Theme.Spacing.space_1)
    }
    
    var button: some View {
        Button(Strings.pokemonDetailRetry) {
            presenter.loadPokemonDetail()
        }
        .buttonStyle(.filled)
        .frame(width: buttonWidth)
    }
}

struct PokemonDetailErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter: MockPokemonDetailPresenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokemonDetailErrorView<MockPokemonDetailPresenter>()
                    .environmentObject(presenter)
            }
        }
    }
}
