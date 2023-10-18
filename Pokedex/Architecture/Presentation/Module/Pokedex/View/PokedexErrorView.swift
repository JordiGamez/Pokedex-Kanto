//
//  PokedexErrorView.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct PokedexErrorView<Presenter: PokedexPresenter>: View {
    
    private let iconSize: CGFloat = 24
    private let iconCircleSize: CGFloat = 64
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
        Text(Strings.pokedexError)
            .font(Theme.Font.body1)
            .foregroundColor(Theme.Color.onBackground)
            .multilineTextAlignment(.center)
            .padding(.horizontal, Theme.Spacing.space_10)
            .padding(.bottom, Theme.Spacing.space_1)
    }
    
    var button: some View {
        Button(Strings.pokedexRetry) {
            presenter.loadPokemon()
        }
        .buttonStyle(.filled)
        .frame(width: buttonWidth)
    }
}

struct PokedexErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter: MockPokedexPresenter = MockPokedexPresenter(pokemonList: [])
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokedexErrorView<MockPokedexPresenter>()
                    .environmentObject(presenter)
            }
        }
    }
}
