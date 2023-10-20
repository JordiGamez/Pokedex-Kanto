//
//  PokemonDetailErrorMapperUnitTests.swift
//  PokedexUnitTests
//
//  Created by Jordi Gámez on 20/10/23.
//

import XCTest
@testable import Pokedex

final class PokemonDetailErrorMapperUnitTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func test_map_invalidUrl() {
        // Given
        let error = DataError.invalidUrl
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_encoding() {
        // Given
        let error = DataError.encoding
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_decoding() {
        // Given
        let error = DataError.decoding
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_badRequest() {
        // Given
        let error = DataError.badRequest
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_unauthorized() {
        // Given
        let error = DataError.unauthorized
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_forbidden() {
        // Given
        let error = DataError.forbidden
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_server() {
        // Given
        let error = DataError.server
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_maintenanceMode() {
        // Given
        let error = DataError.maintenanceMode
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_network() {
        // Given
        let error = DataError.network
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_notFound() {
        // Given
        let error = DataError.notFound
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_conflict() {
        // Given
        let error = DataError.conflict
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_tooManyRequests() {
        // Given
        let error = DataError.tooManyRequests(retryAfterMiliseconds: nil)
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_unknown() {
        // Given
        let error = DataError.unknown
        
        // When
        let result = PokemonDetailErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
}
