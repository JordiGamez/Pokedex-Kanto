//
//  GetPokemonDetailInteractorUnitTests.swift
//  PokedexUnitTests
//
//  Created by Jordi Gámez on 20/10/23.
//

import XCTest
import SwiftyMocky
import Combine
@testable import Pokedex

final class GetPokemonDetailInteractorUnitTests: XCTestCase {
    
    // Class
    var entity: PokemonDetailEntity!
    var interactor: GetPokemonDetailInteractorDefault!
    
    // Mock
    var repository: PokemonRepositoryMock!
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
    }
    
    func test_execute_success() async {
        // Given
        let response = Just(entity!)
            .setFailureType(to: DataError.self)
            .eraseToAnyPublisher()
        Given(repository, .getPokemonDetail(id: Parameter(stringLiteral: "25"), willReturn: response))
        
        // When + Then
        _ = interactor.execute(id: "25")
            .sink(
                receiveCompletion: { _ in },
                receiveValue: {
                    XCTAssertEqual($0, PokemonDetailMapper.map(self.entity!))
                }
            )
    }
    
    func test_execute_failure_generic() async {
        // Given
        let response = Fail<PokemonDetailEntity, DataError>(error: DataError.forbidden)
            .eraseToAnyPublisher()
        Given(repository, .getPokemonDetail(id: Parameter(stringLiteral: "25"), willReturn: response))
        
        // When + Then
        _ = interactor.execute(id: "25")
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTAssertEqual(error, PokemonDetailErrorMapper.map(DataError.forbidden))
                    }
                },
                receiveValue: { _ in }
            )
    }
}

extension GetPokemonDetailInteractorUnitTests {
    
    func buildMocks() {
        repository = PokemonRepositoryMock()
    }
    
    func buildClass() {
        interactor = GetPokemonDetailInteractorDefault(repository: repository)
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
