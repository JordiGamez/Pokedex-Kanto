//
//  MainConfigurator.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

struct MainConfigurator {
    
    static var initialViewController: NavigationController {
        getHomeScreen()
    }
}

private extension MainConfigurator {
    
    static func getHomeScreen() -> NavigationController {
        let navController = NavigationController()
        let viewController = PokedexConfigurator(navigationController: navController).viewController()
        navController.viewControllers = [viewController]
        
        return navController
    }
}
