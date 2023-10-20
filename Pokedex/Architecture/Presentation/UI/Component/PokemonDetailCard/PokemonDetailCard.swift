//
//  PokemonDetailCard.swift
//  Pokedex
//
//  Created by Jordi Gámez on 19/10/23.
//

import SwiftUI

struct PokemonDetailCard: View {
    
    private let pokemonImageSize: CGFloat = 250
    private let imagePlaceholderOpacity: CGFloat = 0.5
    private let backgroundImageSize: CGFloat = 300
    private let backgroundImageOpacity: CGFloat = 0.6
    private let dataContainerHeight: CGFloat = 0.4
    private let backgroundOpacity: CGFloat = 0.5
    
    let viewModel: PokemonDetailCardViewModel
    
    var body: some View {
        GeometryReader { metrics in
            ZStack(alignment: .center) {
                VStack(alignment: .center, spacing: 0) {
                    name
                    number
                    Spacer()
                }
                backgroundImage
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(Theme.Color.onPrimary)
                            .cornerRadius(Theme.Radius.large, corners: [.topLeft, .topRight])
                            .ignoresSafeArea()
                        VStack {
                            types
                            Spacer()
                        }
                        .padding(.top, Theme.Spacing.space_8)
                        stats
                    }
                    .frame(height: metrics.size.height * dataContainerHeight)
                }
                pokemonImage
            }
            .background(viewModel.backgroundColor.opacity(backgroundOpacity))
        }
    }
    
    var name: some View {
        Text(viewModel.name.firstUppercased)
            .font(Theme.Font.headline1)
            .foregroundColor(Theme.Color.primary)
    }
    
    var number: some View {
        Text(viewModel.numberFormated)
            .font(Theme.Font.headline0)
            .foregroundColor(Theme.Color.onPrimary)
    }
    
    var backgroundImage: some View {
        Image(Assets.images.pokeball)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(Theme.Color.onPrimary)
            .frame(width: backgroundImageSize, height: backgroundImageSize)
            .opacity(backgroundImageOpacity)
    }
    
    var types: some View {
        HStack {
            ForEach(viewModel.types, id: \.name) { type in
                PokemonTypeBadge(viewModel: .init(typeName: type.name))
            }
        }
    }
    
    var stats: some View {
        HStack(alignment: .center) {
            Spacer()
            VStack {
                Text(String(viewModel.weight))
                    .font(Theme.Font.body1)
                    .foregroundColor(Theme.Color.primary)
                Text(Strings.pokemonDetailWeight)
                    .font(Theme.Font.body1)
                    .foregroundColor(Theme.Color.neutral40)
            }
            Spacer()
            VStack {
                Text(String(viewModel.height))
                    .font(Theme.Font.body1)
                    .foregroundColor(Theme.Color.primary)
                Text(Strings.pokemonDetailHeight)
                    .font(Theme.Font.body1)
                    .foregroundColor(Theme.Color.neutral40)
            }
            Spacer()
        }
    }
    
    var pokemonImage: some View {
        Image.cachedURL(URL(string: viewModel.imageURL))
            .placeholder {
                Image(Assets.images.pokeball)
                    .resizable()
                    .opacity(imagePlaceholderOpacity)
                    .frame(width: pokemonImageSize, height: pokemonImageSize)
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: pokemonImageSize, height: pokemonImageSize)
    }
}

// swiftlint:disable no_magic_numbers
struct PokemonDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokemonDetailCard(
                    viewModel: .init(
                        number: 25,
                        name: "Pikachu",
                        imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
                        types: [.init(name: .electric, url: "https://pokeapi.co/api/v2/type/13/")],
                        height: 4,
                        weight: 60,
                        stats: [
                            .init(name: "speed", value: 10),
                            .init(name: "speed", value: 20),
                            .init(name: "speed", value: 30),
                            .init(name: "speed", value: 40),
                            .init(name: "speed", value: 50),
                            .init(name: "speed", value: 60)
                        ]
                    )
                )
            }
        }
    }
}
// swiftlint:enable no_magic_numbers
