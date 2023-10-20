//
//  PokemonTypeBadge.swift
//  Pokedex
//
//  Created by Jordi Gámez on 19/10/23.
//

import SwiftUI

struct PokemonTypeBadge: View {
    
    private let horizontalSpacing: CGFloat = 8
    private let verticalSpacing: CGFloat = 2
    
    let viewModel: PokemonTypeBadgeViewModel
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(viewModel.backgroundColor)
            Text(viewModel.typeNameFormated)
                .font(Theme.Font.caption2)
                .foregroundColor(Theme.Color.onPrimary)
                .padding(.horizontal, horizontalSpacing)
                .padding(.vertical, verticalSpacing)
        }
        .fixedSize()
    }
}

struct PokemonTypeBadge_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokemonTypeBadge(
                    viewModel: .init(
                        typeName: .electric
                    )
                )
            }
        }
    }
}
