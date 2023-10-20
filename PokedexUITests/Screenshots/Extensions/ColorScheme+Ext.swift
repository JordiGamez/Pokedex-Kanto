//
//  ColorScheme+Ext.swift
//  PokedexUITests
//
//  Created by Jordi Gámez on 20/10/23.
//

import SwiftUI

extension ColorScheme {
    
    var interfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        @unknown default:
             return .unspecified
        }
    }
}
