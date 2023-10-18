//
//  OutlinedButtonStyle.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct OutlinedButtonStyle: ButtonStyle {
    
    private struct OutlinedButton: View {
        let configuration: ButtonStyle.Configuration
        let height: CGFloat
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.isLoading) private var isLoading: Bool
        
        private var backgroundColor: Color {
            Theme.Color.primaryContainer.opacity(configuration.isPressed ? 1 : 0)
        }
        
        private var foregroundColor: Color {
            if isLoading {
                return Theme.Color.primary
            } else {
                return isEnabled ? Theme.Color.primary : Theme.Color.neutral50
            }
        }

        var body: some View {
            HStack(spacing: Theme.Spacing.space_1) {
                if isLoading {
                    ProgressView()
                        .tint(Theme.Color.primary)
                    
                    configuration.label.labelStyle(.titleOnly)
                } else {
                    configuration.label
                }
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: height)
            .font(Theme.Font.button)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: Theme.Button.radius))
            .overlay(RoundedRectangle(cornerRadius: Theme.Button.radius)
                .strokeBorder(Theme.Color.outline, lineWidth: 1))
        }
    }

    let height: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        OutlinedButton(configuration: configuration, height: height)
    }
}

extension ButtonStyle where Self == OutlinedButtonStyle {
    
    static var outlined: Self {
        return .init(height: Theme.Button.normalHeight)
    }

    static func outlined(height: CGFloat) -> Self {
        return .init(height: height)
    }
}

struct OutlinedButton_Previews: PreviewProvider {
    
    static var previews: some View {
        let spacing: CGFloat = 20
        let buttonWidth: CGFloat = 170
        
        VStack(spacing: spacing) {
            HStack(spacing: spacing) {
                Button("Outlined Button") {}
                    .buttonStyle(.outlined)
                    .frame(width: buttonWidth)
                
                Button("Outlined Button") {}
                    .buttonStyle(.outlined)
                    .frame(width: buttonWidth)
                    .disabled(true)
            }
            .padding()
            
            HStack(spacing: spacing) {
                Button {} label: {
                    Label("Outlined Button", systemImage: "plus")
                }
                .buttonStyle(.outlined)
                .frame(width: buttonWidth)
                
                Button {} label: {
                    Label("Outlined Button", systemImage: "plus")
                }
                .buttonStyle(.outlined)
                .frame(width: buttonWidth)
                .disabled(true)
            }
            .padding()
        }
        .padding()
    }
}
