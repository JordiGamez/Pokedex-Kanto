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
    
    func testPokedexLoadingScreenLightMode() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .loading
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexLoadingScreen", scheme: .light)
    }
    
    func testPokedexErrorScreenLightMode() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .error
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexErrorScreen", scheme: .light)
    }
    
    func testPokedexEmptyScreenLightMode() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .empty
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexEmptyScreen", scheme: .light)
    }
    
    func testPokedexContentScreenLightMode() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .content
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexContentScreen", scheme: .light)
    }
    
    func testPokedexLoadingScreenDarkMode() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .loading
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexLoadingScreen", scheme: .dark)
    }
    
    func testPokedexErrorScreenDarkMode() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .error
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexErrorScreen", scheme: .dark)
    }
    
    func testPokedexEmptyScreenDarkMode() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .empty
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexEmptyScreen", scheme: .dark)
    }
    
    func testPokedexContentScreenDarkMode() throws {
        let pokemonList = Pokemon.mockList()
        let presenter = MockPokedexPresenter(pokemonList: pokemonList)
        presenter.screenState = .content
        let screen = PokedexView<MockPokedexPresenter>()
            .environmentObject(presenter)
        let viewController = HostingController(rootView: screen)
        PokedexUIGroup.screenshots(viewController, name: "PokedexContentScreen", scheme: .dark)
    }
}
