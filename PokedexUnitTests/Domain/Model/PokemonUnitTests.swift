//
//  PokemonUnitTests.swift
//  PokedexUnitTests
//
//  Created by Jordi Gámez on 17/10/23.
//

import XCTest
@testable import Pokedex

final class PokemonUnitTests: XCTestCase {
    
    // Class
    var model: Pokemon!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_not_nil() {
        XCTAssertNotNil(model.name)
        XCTAssertNotNil(model.url)
    }
}

private extension PokemonUnitTests {
    
    func buildClass() {
        model = .empty()
    }
}
