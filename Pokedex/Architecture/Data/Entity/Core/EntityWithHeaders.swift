//
//  EntityWithHeaders.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

struct EntityWithHeaders<D: Codable, H: Codable>: Entity {
    var data: D?
    var headers: H?
}
