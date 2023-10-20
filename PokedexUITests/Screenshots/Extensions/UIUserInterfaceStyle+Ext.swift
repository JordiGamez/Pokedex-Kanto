//
//  UIUserInterfaceStyle+Ext.swift
//  PokedexUITests
//
//  Created by Jordi Gámez on 20/10/23.
//

import UIKit

extension UIUserInterfaceStyle {
    
    var name: String {
        switch self {
        case .light:
            return "light"
        case .dark:
            return "dark"
        case .unspecified:
            return ""
        @unknown default:
            return ""
        }
    }
}
