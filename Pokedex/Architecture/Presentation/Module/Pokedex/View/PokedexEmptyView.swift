//
//  PokedexEmptyView.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct PokedexEmptyView: View {
    
    private let iconSize: CGFloat = 24
    private let iconCircleSize: CGFloat = 64
    private let textHorizontalPadding: CGFloat = 80
    
    var body: some View {
        VStack(spacing: Theme.Spacing.space_4) {
            icon
            explanation
        }
    }
    
    var icon: some View {
        ZStack {
            Theme.Color.onPrimary
                .frame(width: iconCircleSize, height: iconCircleSize)
                .clipShape(Circle())
            Image(Assets.icon.warningIcon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Theme.Color.primary)
                .frame(width: iconSize, height: iconSize)
        }
    }
    
    var explanation: some View {
        Text(Strings.pokedexEmpty)
            .font(Theme.Font.body1)
            .foregroundColor(Theme.Color.overlay)
            .multilineTextAlignment(.center)
            .padding(.horizontal, textHorizontalPadding)
    }
}

struct PokedexEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokedexEmptyView()
            }
        }
    }
}
