//
//  PokedexConfigurator.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct PokedexConfigurator {
    
    private let navigationController: NavigationController
    
    private var injector: Injector {
        PokedexInjectorProvider.shared.injector
    }
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func viewController() -> UIViewController {
        // Router
        let router = PokedexRouterDefault(navigationController: navigationController)
        
        // Presenter
        let getPokemonInteractor = injector.instanceOf(GetPokemonListInteractor.self)
        let presenter = PokedexPresenterDefault(
            getPokemonInteractor: getPokemonInteractor,
            router: router
        )
        
        // View
        let view: some View = PokedexView<PokedexPresenterDefault>().environmentObject(presenter)
        let hostingController: UIViewController = HostingController(rootView: view)
        
        return hostingController
    }
}
