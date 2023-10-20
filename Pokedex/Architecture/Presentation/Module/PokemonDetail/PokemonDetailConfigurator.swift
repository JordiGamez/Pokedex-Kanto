//
//  PokemonDetailConfigurator.swift
//  Pokedex
//
//  Created by Jordi Gámez on 18/10/23.
//

import SwiftUI

struct PokemonDetailConfigurator {
    
    private let navigationController: NavigationController
    
    private var injector: Injector {
        PokedexInjectorProvider.shared.injector
    }
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func viewController(pokemonNumber: String) -> UIViewController {
        // Router
        let router = PokemonDetailRouterDefault(navigationController: navigationController)
        
        // Presenter
        let getPokemonDetailInteractor = injector.instanceOf(GetPokemonDetailInteractor.self)
        let presenter = PokemonDetailPresenterDefault(
            pokemonNumber: pokemonNumber,
            getPokemonDetailInteractor: getPokemonDetailInteractor,
            router: router
        )
        
        // View
        let view: some View = PokemonDetailView<PokemonDetailPresenterDefault>().environmentObject(presenter)
        let hostingController: UIViewController = HostingController(rootView: view)
        
        return hostingController
    }
}
