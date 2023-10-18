//
//  PokemonCard.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct PokemonCard: View {
    
    private let avatarSize: CGFloat = 90
    private let rowSizeHeight: CGFloat = 64
    private let imagePlaceholderOpacity: CGFloat = 0.5
    private let backgroundImageSize: CGFloat = 150
    private let backgroundImageXOffset: CGFloat = 35
    private let backgroundImageYOffset: CGFloat = 15
    private let backgroundImageOpacity: CGFloat = 0.03
    
    let viewModel: PokemonCardViewModel
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            background
            content
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            HapticManager.triggerMediumImpact()
            onTap()
        }
    }
    
    var background: some View {
        Rectangle()
            .foregroundColor(Theme.Color.onPrimary)
            .overlay {
                backgroundImage
            }
            .frame(height: rowSizeHeight)
            .cornerRadius(Theme.Radius.medium)
    }
    
    var backgroundImage: some View {
        HStack {
            Spacer()
            Image(Assets.images.pokeball)
                .resizable()
                .frame(width: backgroundImageSize, height: backgroundImageSize)
                .offset(x: backgroundImageXOffset, y: backgroundImageYOffset)
                .opacity(backgroundImageOpacity)
        }
    }
    
    var content: some View {
        HStack(spacing: Theme.Spacing.space_2) {
            number
            picture
            name
            Spacer()
        }
        .frame(height: rowSizeHeight)
        .padding(.horizontal, Theme.Spacing.space_2)
    }
    
    var number: some View {
        ZStack {
            Circle()
                .fill(Theme.Color.surfaceVariant)
                .padding(.vertical, Theme.Spacing.space_1_5)
            Text(viewModel.number)
                .font(Theme.Font.caption1)
                .foregroundColor(Theme.Color.primary)
        }
    }
    
    var picture: some View {
        Image.cachedURL(URL(string: viewModel.imageURL))
            .placeholder {
                Image(Assets.images.pokeball)
                    .resizable()
                    .opacity(imagePlaceholderOpacity)
                    .frame(width: avatarSize, height: avatarSize)
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: avatarSize, height: avatarSize)
    }
    
    var name: some View {
        Text(viewModel.name.firstUppercased)
            .font(Theme.Font.body1)
            .foregroundColor(Theme.Color.primary)
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokemonCard(
                    viewModel: .init(
                        number: "25",
                        name: "Pikachu",
                        imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"
                    ),
                    onTap: {
                        // Intentionally empty
                    }
                )
            }
        }
    }
}
