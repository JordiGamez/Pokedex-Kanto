//
//  MainLogoToolbar.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

private typealias builder = ToolbarItemsBuilder

struct MainLogoToolbar: ViewModifier {
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        builder.logoIcon(
                            logo: Image(Assets.images.pokedex)
                        )
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Previews

struct MainLogoToolbarTestView: View {
    
    var body: some View {
        ZStack {
            Text("MainLogoToolbar")
        }
        .toolbar(.logo)
    }
}

struct MainToolbarTestView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            MainLogoToolbarTestView()
        }
    }
}
