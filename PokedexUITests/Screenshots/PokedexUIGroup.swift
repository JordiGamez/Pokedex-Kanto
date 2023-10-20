//
//  PokedexUIGroup.swift
//  PokedexUITests
//
//  Created by Jordi Gámez on 17/10/23.
//

import SwiftUI
import SnapshotTesting

final class PokedexUIGroup: UIGroup {
    
    static var identifier: String = "pokedex"
    
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
