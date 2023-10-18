//
//  FilledButtonStyle.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

struct FilledButtonStyle: ButtonStyle {
    
    private struct FilledButton: View {
        let configuration: ButtonStyle.Configuration
        let height: CGFloat
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.isLoading) private var isLoading: Bool
        
        private var backgroundColor: Color {
            if isLoading {
                return Theme.Color.primary.opacity(Theme.Button.loadingOpacity)
            } else {
                if isEnabled {
                    return configuration.isPressed ? Theme.Color.onPrimaryContainer : Theme.Color.primary
                } else {
                    return Theme.Color.surface
                }
            }
        }
        private var foregroundColor: Color {
            if isLoading {
                return Theme.Color.onPrimary
            } else {
                return isEnabled ? Theme.Color.onPrimary : Theme.Color.neutral50
            }
        }

        var body: some View {
            HStack(spacing: Theme.Spacing.space_1) {
                if isLoading {
                    ProgressView()
                        .tint(Theme.Color.onPrimary)
                    
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
        }
    }

    let height: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        FilledButton(configuration: configuration, height: height)
    }
}

extension ButtonStyle where Self == FilledButtonStyle {
    
    static var filled: Self {
        return .init(height: Theme.Button.normalHeight)
    }
    
    static func filled(height: CGFloat) -> Self {
        return .init(height: height)
    }
}

struct FilledButton_Previews: PreviewProvider {
    
    static var previews: some View {
        let spacing: CGFloat = 20
        let buttonWidth: CGFloat = 170
        
        VStack(spacing: spacing) {
            HStack(spacing: spacing) {
                Button("Filled Button") {}
                    .buttonStyle(.filled)
                    .frame(width: buttonWidth)
                
                Button("Filled Button") {}
                    .buttonStyle(.filled)
                    .frame(width: buttonWidth)
                    .disabled(true)
            }
            .padding()
            
            HStack(spacing: spacing) {
                Button {} label: {
                    Label("Filled Button", systemImage: "plus")
                }
                .buttonStyle(.filled)
                .frame(width: buttonWidth)
                
                Button {} label: {
                    Label("Filled Button", systemImage: "plus")
                }
                .buttonStyle(.filled)
                .frame(width: buttonWidth)
                .disabled(true)
            }
            .padding()
            
            HStack(spacing: spacing) {
                Button("Filled Button") {}
                    .buttonStyle(.filled)
                    .frame(width: buttonWidth)
                    .isLoading(true)
                
                Button {} label: {
                    Label("Filled Button", systemImage: "plus")
                }
                .buttonStyle(.filled)
                .frame(width: buttonWidth)
                .isLoading(true)
            }
            .padding()
        }
        .padding()
    }
}
