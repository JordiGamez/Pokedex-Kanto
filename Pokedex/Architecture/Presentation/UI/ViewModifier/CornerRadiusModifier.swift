//
//  CornerRadiusModifier.swift
//  Pokedex
//
//  Created by Jordi Gámez on 19/10/23.
//

import SwiftUI

extension View {
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        modifier(CornerRadiusStyle(radius: radius, corners: corners))
    }
}

private struct CornerRadiusShape: Shape {
    
    let radius: CGFloat
    let corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

private struct CornerRadiusStyle: ViewModifier {
    
    let radius: CGFloat
    let corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

struct CornerRadiusShape_Previews: PreviewProvider {
    static let radius: CGFloat = 25
    static let side: CGFloat = 100
    
    static var previews: some View {
        Color.red
            .cornerRadius(radius, corners: [.topLeft, .bottomRight])
            .frame(width: side, height: side, alignment: .center)
    }
}
