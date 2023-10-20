//
//  DevicesPreview.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct DevicesPreview<Content>: View where Content: View {
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (Light)")
            .preferredColorScheme(.light)
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro (Light)")
            .preferredColorScheme(.light)
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max (Light)")
            .preferredColorScheme(.light)
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (Dark)")
            .preferredColorScheme(.dark)
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro (Dark)")
            .preferredColorScheme(.dark)
        content()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max (Dark)")
            .preferredColorScheme(.dark)
    }
}
