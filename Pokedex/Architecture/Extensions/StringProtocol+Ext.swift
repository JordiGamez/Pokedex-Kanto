//
//  StringProtocol+Ext.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

extension StringProtocol {
    
    var firstUppercased: String {
        prefix(1).uppercased() + dropFirst()
    }
}
