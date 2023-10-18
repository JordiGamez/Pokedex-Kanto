//
//  NavigationToolbar.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

private typealias builder = ToolbarItemsBuilder

struct NavigationToolbar: ViewModifier {
    
    let action: ((_ action: ToolbarAction) -> Void)?
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        builder.iconButton(
                            buttonImage: Image(systemName: Assets.System.chevronLeft),
                            buttonAction: .goBack,
                            action: action,
                            paddingEdge: .all
                        )
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Previews

struct NavigationToolbarTestView: View {
    
    var body: some View {
        ZStack {
            Text("NavigationToolbar")
        }
        .toolbar(.backButton) { action in
            print(action)
        }
    }
}

struct NavigationToolbarTestView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesPreview {
            NavigationToolbarTestView()
        }
    }
}
