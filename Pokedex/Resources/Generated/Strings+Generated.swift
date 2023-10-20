// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// MARK: - Strings

internal enum Strings {
  /// Localizable.strings
  ///   Pokedex
  /// 
  ///   Created by Jordi Gámez on 16/10/23.
  internal static let pokedexEmpty = Strings.tr("Localizable", "pokedex_empty", fallback: "There are no Pokémon in the Pokédex")
  /// Unable to load the Pokédex, please try again
  internal static let pokedexError = Strings.tr("Localizable", "pokedex_error", fallback: "Unable to load the Pokédex, please try again")
  /// Retry
  internal static let pokedexRetry = Strings.tr("Localizable", "pokedex_retry", fallback: "Retry")
  /// Pokémon not found
  internal static let pokemonDetailEmpty = Strings.tr("Localizable", "pokemon_detail_empty", fallback: "Pokémon not found")
  /// Unable to load the Pokémon, please try again
  internal static let pokemonDetailError = Strings.tr("Localizable", "pokemon_detail_error", fallback: "Unable to load the Pokémon, please try again")
  /// Height
  internal static let pokemonDetailHeight = Strings.tr("Localizable", "pokemon_detail_height", fallback: "Height")
  /// Retry
  internal static let pokemonDetailRetry = Strings.tr("Localizable", "pokemon_detail_retry", fallback: "Retry")
  /// Weight
  internal static let pokemonDetailWeight = Strings.tr("Localizable", "pokemon_detail_weight", fallback: "Weight")
}

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
