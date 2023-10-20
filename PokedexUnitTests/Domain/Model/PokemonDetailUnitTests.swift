//
//  PokemonDetailUnitTests.swift
//  PokedexUnitTests
//
//  Created by Jordi Gámez on 20/10/23.
//

import XCTest
@testable import Pokedex

final class PokemonDetailUnitTests: XCTestCase {
    
    // Class
    var model: PokemonDetail!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_not_nil() {
        XCTAssertNotNil(model.number)
        XCTAssertNotNil(model.name)
        XCTAssertNotNil(model.imageUrl)
        XCTAssertNotNil(model.types)
        XCTAssertNotNil(model.height)
        XCTAssertNotNil(model.weight)
        XCTAssertNotNil(model.stats)
    }
}

private extension PokemonDetailUnitTests {
    
    func buildClass() {
        model = .empty()
    }
}
