//
//  PokemonDetailScreenTests.swift
//  PokedexUITests
//
//  Created by Jordi Gámez on 20/10/23.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Pokedex

final class PokemonDetailScreenTests: XCTestCase {
    
    func testPokemonDetailLoadingScreenLightMode() throws {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        presenter.screenState = .loading
        let screen = PokemonDetailView<MockPokemonDetailPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokemonDetailUIGroup.screenshots(viewController, name: "PokemonDetailLoadingScreen", scheme: .light)
    }
    
    func testPokemonDetailErrorScreenLightMode() throws {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        presenter.screenState = .error
        let screen = PokemonDetailView<MockPokemonDetailPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokemonDetailUIGroup.screenshots(viewController, name: "PokemonDetailErrorScreen", scheme: .light)
    }
    
    func testPokemonDetailEmptyScreenLightMode() throws {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        presenter.screenState = .empty
        let screen = PokemonDetailView<MockPokemonDetailPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokemonDetailUIGroup.screenshots(viewController, name: "PokemonDetailEmptyScreen", scheme: .light)
    }
    
    func testPokemonDetailContentScreenLightMode() throws {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        presenter.screenState = .content
        let screen = PokemonDetailView<MockPokemonDetailPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokemonDetailUIGroup.screenshots(viewController, name: "PokemonDetailContentScreen", scheme: .light)
    }
    
    func testPokemonDetailLoadingScreenDarkMode() throws {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        presenter.screenState = .loading
        let screen = PokemonDetailView<MockPokemonDetailPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokemonDetailUIGroup.screenshots(viewController, name: "PokemonDetailLoadingScreen", scheme: .dark)
    }
    
    func testPokemonDetailErrorScreenDarkMode() throws {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        presenter.screenState = .error
        let screen = PokemonDetailView<MockPokemonDetailPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokemonDetailUIGroup.screenshots(viewController, name: "PokemonDetailErrorScreen", scheme: .dark)
    }
    
    func testPokemonDetailEmptyScreenDarkMode() throws {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        presenter.screenState = .empty
        let screen = PokemonDetailView<MockPokemonDetailPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokemonDetailUIGroup.screenshots(viewController, name: "PokemonDetailEmptyScreen", scheme: .dark)
    }
    
    func testPokemonDetailContentScreenDarkMode() throws {
        let pokemonDetail = PokemonDetailViewModel.mock()
        let presenter = MockPokemonDetailPresenter(pokemonDetail: pokemonDetail)
        presenter.screenState = .content
        let screen = PokemonDetailView<MockPokemonDetailPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokemonDetailUIGroup.screenshots(viewController, name: "PokemonDetailContentScreen", scheme: .dark)
    }
}
