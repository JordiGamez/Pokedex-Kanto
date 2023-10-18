//
//  View+Ext.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

extension View {
    
    func isLoading(_ loading: Bool) -> some View {
        environment(\.isLoading, loading)
    }
}
