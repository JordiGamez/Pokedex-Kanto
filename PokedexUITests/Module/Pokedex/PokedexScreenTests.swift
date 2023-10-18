//
//  PokedexScreenTests.swift
//  PokedexUITests
//
//  Created by Jordi Gámez on 17/10/23.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import Pokedex

final class PokedexScreenTests: XCTestCase {
    
    func testPokedexLoadingScreen() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .loading
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexLoadingScreen")
    }
    
    func testPokedexErrorScreen() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .error
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexErrorScreen")
    }
    
    func testPokedexEmptyScreen() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .empty
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexEmptyScreen")
    }
    
    func testPokedexContentScreen() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .content
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexContentScreen")
    }
}
