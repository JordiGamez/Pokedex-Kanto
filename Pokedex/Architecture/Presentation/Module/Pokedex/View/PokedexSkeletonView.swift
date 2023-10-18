//
//  PokedexSkeletonView.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct PokedexSkeletonView: View {
    
    private let numberOfItems: Int = 10
    private let itemHeight: CGFloat = 64
    
    var body: some View {
        ScrollView {
            VStack(spacing: .zero) {
                ForEach(1...numberOfItems, id: \.self) { _ in
                    item
                }
            }
            .padding(.horizontal, Theme.Spacing.space_2)
        }
        .padding(.vertical, Theme.Spacing.space_1)
    }
    
    var item: some View {
        Rectangle()
            .frame(height: itemHeight)
            .cornerRadius(Theme.Spacing.space_1)
            .foregroundColor(Theme.Color.transparentPrimary5)
            .padding(.bottom, Theme.Spacing.space_2)
    }
}

struct PokedexSkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            ZStack {
                Theme.Color.surfaceContainerLow.ignoresSafeArea()
                PokedexSkeletonView()
            }
        }
    }
}
