//
//  PokedexUIGroup.swift
//  PokedexUITests
//
//  Created by Jordi Gámez on 17/10/23.
//

import UIKit
import SnapshotTesting

final class PokedexUIGroup: UIGroup {
    
    static var identifier: String = "pokedex"
    
    static func screenshots(_ viewController: UIViewController, name: String) {
        _ = UITheme.Devices.list.map { device in
            assertSnapshot(
                matching: viewController,
                as: .image(on: device.value),
                named: "\(identifier)-\(name)-\(device.key)"
            )
        }
    }
}
