//
//  PokemonDetailUIGroup.swift
//  PokedexUITests
//
//  Created by Jordi Gámez on 20/10/23.
//

import SwiftUI
import SnapshotTesting

final class PokemonDetailUIGroup: UIGroup {
    
    static var identifier: String = "pokemonDetail"
    
    static func screenshots(_ viewController: UIViewController, name: String, scheme: ColorScheme) {
        _ = UITheme.Devices.list.map { device in
            viewController.overrideUserInterfaceStyle = scheme.interfaceStyle
            assertSnapshot(
                matching: viewController,
                as: .image(on: device.value),
                named: "\(identifier)-\(name)-\(device.key)-\(scheme.interfaceStyle.name)"
            )
        }
    }
}
