//
//  Image+Kingfisher.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI
import Kingfisher

extension Image {
    
    static func cachedURL(_ url: URL?) -> KFImage {
        KFImage.url(url, cacheKey: url?.cacheKey)
    }
}
