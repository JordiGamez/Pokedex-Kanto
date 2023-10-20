//
//  PokemonDetailMapperUnitTests.swift
//  PokedexUnitTests
//
//  Created by Jordi Gámez on 20/10/23.
//

import XCTest
@testable import Pokedex

final class PokemonDetailMapperUnitTests: XCTestCase {
    
    var entity: PokemonDetailEntity!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_map_nil() {
        // Given
        let entity = PokemonDetailEntity(
            id: nil,
            name: nil,
            sprites: nil,
            types: [],
            height: nil,
            weight: nil,
            stats: []
        )
        
        // When
        let result = PokemonDetailMapper.map(entity)
        
        // Then
        XCTAssertEqual(result, .empty())
        XCTAssertNotNil(result.number)
        XCTAssertNotNil(result.name)
        XCTAssertNotNil(result.imageUrl)
        XCTAssertNotNil(result.types)
        XCTAssertNotNil(result.height)
        XCTAssertNotNil(result.weight)
        XCTAssertNotNil(result.stats)
    }
    
    func test_map_success() {
        // When
        let result = PokemonDetailMapper.map(entity)
        
        // Then
        XCTAssertEqual(result.number, 25)
        XCTAssertEqual(result.name, "Pikachu")
        XCTAssertEqual(result.imageUrl, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
        XCTAssertEqual(result.types, [.init(name: .electric, url: "https://pokeapi.co/api/v2/type/13/")])
        XCTAssertEqual(result.height, 4)
        XCTAssertEqual(result.weight, 60)
        XCTAssertEqual(result.stats, [
            .init(name: "speed", value: 10),
            .init(name: "speed", value: 20),
            .init(name: "speed", value: 30),
            .init(name: "speed", value: 40),
            .init(name: "speed", value: 50),
            .init(name: "speed", value: 60),
        ])
    }
    
    func test_map_failure() {
        // When
        let result = PokemonDetailMapper.map(entity)
        
        // Then
        XCTAssertNotEqual(result.number, 1)
        XCTAssertNotEqual(result.name, "Bulbasaur")
        XCTAssertNotEqual(result.imageUrl, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")
        XCTAssertNotEqual(result.types, [.init(name: .electric, url: "https://pokeapi.co/api/v2/type/1/")])
        XCTAssertNotEqual(result.height, 40)
        XCTAssertNotEqual(result.weight, 600)
        XCTAssertNotEqual(result.stats, [
            .init(name: "attack", value: 10),
            .init(name: "attack", value: 20),
            .init(name: "attack", value: 30),
            .init(name: "attack", value: 40),
            .init(name: "attack", value: 50),
            .init(name: "attack", value: 60),
        ])
    }
}

private extension PokemonDetailMapperUnitTests {
    
    func buildClass() {
        entity = .init(
            id: 25,
            name: "Pikachu",
            sprites: Sprites(other: Other(artwork: Artwork(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"))),
            types: [
                .init(type: .init(name: .electric, url: "https://pokeapi.co/api/v2/type/13/"))
            ],
            height: 4,
            weight: 60,
            stats: [
                .init(value: 10, stat: .init(name: "speed")),
                .init(value: 20, stat: .init(name: "speed")),
                .init(value: 30, stat: .init(name: "speed")),
                .init(value: 40, stat: .init(name: "speed")),
                .init(value: 50, stat: .init(name: "speed")),
                .init(value: 60, stat: .init(name: "speed"))
            ]
        )
    }
}
