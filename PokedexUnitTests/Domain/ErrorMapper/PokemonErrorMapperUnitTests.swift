//
//  PokemonErrorMapperUnitTests.swift
//  PokedexUnitTests
//
//  Created by Jordi Gámez on 17/10/23.
//

import XCTest
@testable import Pokedex

final class PokemonErrorMapperUnitTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func test_map_invalidUrl() {
        // Given
        let error = DataError.invalidUrl
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_encoding() {
        // Given
        let error = DataError.encoding
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_decoding() {
        // Given
        let error = DataError.decoding
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_badRequest() {
        // Given
        let error = DataError.badRequest
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_unauthorized() {
        // Given
        let error = DataError.unauthorized
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_forbidden() {
        // Given
        let error = DataError.forbidden
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_server() {
        // Given
        let error = DataError.server
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_maintenanceMode() {
        // Given
        let error = DataError.maintenanceMode
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_network() {
        // Given
        let error = DataError.network
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_notFound() {
        // Given
        let error = DataError.notFound
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_conflict() {
        // Given
        let error = DataError.conflict
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_tooManyRequests() {
        // Given
        let error = DataError.tooManyRequests(retryAfterMiliseconds: nil)
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
    
    func test_map_unknown() {
        // Given
        let error = DataError.unknown
        
        // When
        let result = PokemonErrorMapper.map(error)
        
        // Then
        XCTAssertEqual(result, .undefined)
    }
}
