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
  /// Unable to load the Pokédex, please try again.
  internal static let pokedexError = Strings.tr("Localizable", "pokedex_error", fallback: "Unable to load the Pokédex, please try again.")
  /// Retry
  internal static let pokedexRetry = Strings.tr("Localizable", "pokedex_retry", fallback: "Retry")
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
