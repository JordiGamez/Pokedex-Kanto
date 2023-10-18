// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import UIKit.UIFont
import SwiftUI

// MARK: - Fonts

internal enum CustomFonts {
  internal enum openSans {
    internal static let bold = FontConvertible(name: "OpenSans-Bold", family: "Open Sans", path: "OpenSans-Bold.ttf")
    internal static let boldItalic = FontConvertible(name: "OpenSans-BoldItalic", family: "Open Sans", path: "OpenSans-BoldItalic.ttf")
    internal static let italic = FontConvertible(name: "OpenSans-Italic", family: "Open Sans", path: "OpenSans-Italic.ttf")
    internal static let regular = FontConvertible(name: "OpenSans-Regular", family: "Open Sans", path: "OpenSans-Regular.ttf")
    internal static let semiBold = FontConvertible(name: "OpenSans-SemiBold", family: "Open Sans", path: "OpenSans-SemiBold.ttf")
    internal static let semiBoldItalic = FontConvertible(name: "OpenSans-SemiBoldItalic", family: "Open Sans", path: "OpenSans-SemiBoldItalic.ttf")
    internal static let all: [FontConvertible] = [bold, boldItalic, italic, regular, semiBold, semiBoldItalic]
  }
  internal static let allCustomFonts: [FontConvertible] = [openSans.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  internal func swiftUIFont(size: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size)
  }

  internal func swiftUIFont(fixedSize: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, fixedSize: fixedSize)
  }

  internal func swiftUIFont(size: CGFloat, relativeTo textStyle: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size, relativeTo: textStyle)
  }

  internal func register() {
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate func registerIfNeeded() {
    if !UIFont.fontNames(forFamilyName: family).contains(name) {
      register()
    }
  }

  fileprivate var url: URL? {
    BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension UIFont {
  convenience init?(font: FontConvertible, size: CGFloat) {
    font.registerIfNeeded()
    self.init(name: font.name, size: size)
  }
}

internal extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, size: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size)
  }
}

internal extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, fixedSize: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, fixedSize: fixedSize)
  }

  static func custom(
    _ font: FontConvertible,
    size: CGFloat,
    relativeTo textStyle: SwiftUI.Font.TextStyle
  ) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size, relativeTo: textStyle)
  }
}

private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
