//
//  MainConfigurator.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

struct MainConfigurator {
    
    static var initialViewController: NavigationController {
        homeScreen()
    }
}

private extension MainConfigurator {
    
    static func homeScreen() -> NavigationController {
        let navController = NavigationController()
        let viewController = PokedexConfigurator(navigationController: navController).viewController()
        navController.viewControllers = [viewController]
        
        return navController
    }
}
