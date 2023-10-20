//
//  Font.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

extension Theme {
    
    enum Font {
        
        static var headline0: SwiftUI.Font = CustomFonts.openSans.bold.swiftUIFont(fixedSize: 125)
        static var headline1: SwiftUI.Font = CustomFonts.openSans.bold.swiftUIFont(fixedSize: 30)
        static var headline2: SwiftUI.Font = CustomFonts.openSans.bold.swiftUIFont(fixedSize: 24)
        static var headline3: SwiftUI.Font = CustomFonts.openSans.semiBold.swiftUIFont(fixedSize: 16)
        static var headline4: SwiftUI.Font = CustomFonts.openSans.semiBold.swiftUIFont(fixedSize: 15)
        static var headline5: SwiftUI.Font = CustomFonts.openSans.bold.swiftUIFont(fixedSize: 14)
        static var body1: SwiftUI.Font = CustomFonts.openSans.regular.swiftUIFont(fixedSize: 15)
        static var body2: SwiftUI.Font = CustomFonts.openSans.semiBold.swiftUIFont(fixedSize: 14)
        static var body3: SwiftUI.Font = CustomFonts.openSans.regular.swiftUIFont(fixedSize: 14)
        static var body4: SwiftUI.Font = CustomFonts.openSans.regular.swiftUIFont(fixedSize: 13)
        static var body5: SwiftUI.Font = CustomFonts.openSans.semiBold.swiftUIFont(fixedSize: 13)
        static var caption0: SwiftUI.Font = CustomFonts.openSans.semiBold.swiftUIFont(fixedSize: 10)
        static var caption1: SwiftUI.Font = CustomFonts.openSans.semiBold.swiftUIFont(fixedSize: 13)
        static var caption2: SwiftUI.Font = CustomFonts.openSans.regular.swiftUIFont(fixedSize: 13)
        static var button: SwiftUI.Font = CustomFonts.openSans.semiBold.swiftUIFont(fixedSize: 14)
    }
}
