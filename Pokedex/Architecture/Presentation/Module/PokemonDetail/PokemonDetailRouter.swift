//
//  PokemonDetailRouter.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//

import Foundation

protocol PokemonDetailRouter {
    func navigateBack()
}

final class PokemonDetailRouterDefault {
    
    private weak var navigationController: NavigationController?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
}

extension PokemonDetailRouterDefault: PokemonDetailRouter {
    
    func navigateBack() {
        guard let navigationController else {
            return
        }
        navigationController.popViewController(animated: true)
    }
}
