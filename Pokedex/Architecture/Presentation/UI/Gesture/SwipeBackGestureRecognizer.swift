//
//  SwipeBackGestureRecognizer.swift
//  Pokedex
//
//  Created by Jordi Gámez on 20/10/23.
//

import SwiftUI

struct SwipeBackGestureRecognizer: View {
    
    private static let recognizerFrameWidth: CGFloat = 15
    private static let minimumDrag: CGFloat = 5
    
    let onFire: () -> Void
    
    var body: some View {
        HStack {
            Color.clear
                .frame(width: Self.recognizerFrameWidth)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: Self.minimumDrag).onChanged { value in
                        if value.translation.width > 0 {
                            onFire()
                        }
                    }
                )
            Spacer()
        }
    }
}
