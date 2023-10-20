//
//  PokemonDetailSkeletonView.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//

import SwiftUI

struct PokemonDetailSkeletonView: View {
    
    private let numberOfItems: Int = 10
    private let nameHeight: CGFloat = 30
    private let nameWidth: CGFloat = 180
    private let numberHeight: CGFloat = 90
    private let numberWidth: CGFloat = 220
    private let imageWidth: CGFloat = 250
    private let dataContainerHeight: CGFloat = 0.4
    
    var body: some View {
        GeometryReader { metrics in
            ZStack(alignment: .center) {
                VStack(alignment: .center, spacing: 0) {
                    Rectangle()
                        .frame(width: nameWidth, height: nameHeight)
                        .cornerRadius(Theme.Spacing.space_1)
                        .foregroundColor(Theme.Color.transparentPrimary5)
                        .padding(.bottom, Theme.Spacing.space_2)
                    Rectangle()
                        .frame(width: numberWidth, height: numberHeight)
                        .cornerRadius(Theme.Spacing.space_1)
                        .foregroundColor(Theme.Color.transparentPrimary5)
                        .padding(.bottom, Theme.Spacing.space_2)
                    Spacer()
                }
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(Theme.Color.transparentPrimary5)
                            .cornerRadius(Theme.Radius.large, corners: [.topLeft, .topRight])
                            .ignoresSafeArea()
                    }
                    .frame(height: metrics.size.height * dataContainerHeight)
                }
                Circle()
                    .frame(width: imageWidth)
                    .foregroundColor(Theme.Color.transparentPrimary5)
            }
        }
    }
}

struct PokemonDetailSkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            PokemonDetailSkeletonView()
        }
    }
}
