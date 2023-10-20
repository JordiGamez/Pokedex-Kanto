//
//  NavigationController.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import UIKit

final class NavigationController: UINavigationController {
    
    // iOS 15: Used to always hide the native UINavigationBar when navigating
    override var isNavigationBarHidden: Bool {
        get { true }
        set { super.isNavigationBarHidden = newValue }
    }
}
