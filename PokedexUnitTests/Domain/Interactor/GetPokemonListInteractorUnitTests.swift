//
//  GetPokemonListInteractorUnitTests.swift
//  PokedexUnitTests
//
//  Created by Jordi Gámez on 17/10/23.
//

import XCTest
import SwiftyMocky
import Combine
@testable import Pokedex

final class GetPokemonListInteractorUnitTests: XCTestCase {
    
    // Class
    var entity: PokemonListEntity!
    var interactor: GetPokemonListInteractorDefault!
    
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
        Given(repository, .getPokemonList(region: .value(.kanto), willReturn: response))
        
        // When + Then
        _ = interactor.execute(region: .kanto)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: {
                    XCTAssertEqual($0.first, PokemonMapper.map(self.entity.results.first!))
                }
            )
    }
    
    func test_execute_failure_generic() async {
        // Given
        let response = Fail<PokemonListEntity, DataError>(error: DataError.forbidden)
            .eraseToAnyPublisher()
        Given(repository, .getPokemonList(region: .value(.kanto), willReturn: response))
        
        // When + Then
        _ = interactor.execute(region: .kanto)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTAssertEqual(error, PokemonErrorMapper.map(DataError.forbidden))
                    }
                },
                receiveValue: { _ in }
            )
    }
}

extension GetPokemonListInteractorUnitTests {
    
    func buildMocks() {
        repository = PokemonRepositoryMock()
    }
    
    func buildClass() {
        interactor = GetPokemonListInteractorDefault(repository: repository)
        entity = .init(
            count: 1,
            results: [.init(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/")]
        )
    }
}
