//
//  PokemonMapperUnitTests.swift
//  PokedexUnitTests
//
//  Created by Jordi Gámez on 17/10/23.
//

import XCTest
@testable import Pokedex

final class PokemonMapperUnitTests: XCTestCase {
    
    var entity: PokemonEntity!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_map_nil() {
        // Given
        let entity = PokemonEntity(name: nil, url: nil)
        
        // When
        let result = PokemonMapper.map(entity)
        
        // Then
        XCTAssertEqual(result, .empty())
        XCTAssertNotNil(result.name)
        XCTAssertNotNil(result.url)
    }
    
    func test_map_success() {
        // When
        let result = PokemonMapper.map(entity)
        
        // Then
        XCTAssertEqual(result.name, "pikachu")
        XCTAssertEqual(result.url, "https://pokeapi.co/api/v2/pokemon/25/")
    }
    
    func test_map_failure() {
        // When
        let result = PokemonMapper.map(entity)
        
        // Then
        XCTAssertNotEqual(result.name, "bulbasaur")
        XCTAssertNotEqual(result.url, "https://pokeapi.co/api/v2/pokemon/1/")
    }
}

private extension PokemonMapperUnitTests {
    
    func buildClass() {
        entity = .init(
            name: "pikachu",
            url: "https://pokeapi.co/api/v2/pokemon/25/"
        )
    }
}
