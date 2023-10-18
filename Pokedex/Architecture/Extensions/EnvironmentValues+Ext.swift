//
//  EnvironmentValues+Ext.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct CustomLoadingKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    
    var isLoading: Bool {
        get { self[CustomLoadingKey.self] }
        set { self[CustomLoadingKey.self] = newValue }
    }
}
