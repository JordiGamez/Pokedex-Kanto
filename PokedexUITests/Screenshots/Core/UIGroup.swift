//
//  UIGroup.swift
//  PokedexUITests
//
//  Created by Jordi Gámez on 17/10/23.
//

import UIKit

protocol UIGroup {
    
    static var identifier: String { get set }
    
    static func screenshots(_ viewController: UIViewController, name: String)
}
