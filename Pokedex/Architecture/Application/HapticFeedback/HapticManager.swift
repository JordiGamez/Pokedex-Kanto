//
//  HapticManager.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import UIKit

final class HapticManager {
    
    private static let standardImpactIntensity: CGFloat = 0.8
    
    static func triggerSuccessFeedback() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
    
    static func triggerWarningFeedback() {
        UINotificationFeedbackGenerator().notificationOccurred(.warning)
    }
    
    static func triggerErrorFeedback() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
    
    static func triggerSelectionFeedback() {
        UISelectionFeedbackGenerator().selectionChanged()
    }
    
    static func triggerLightImpact() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred(intensity: standardImpactIntensity)
    }
    
    static func triggerMediumImpact() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred(intensity: standardImpactIntensity)
    }
    
    static func triggerHeavyImpact() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred(intensity: standardImpactIntensity)
    }
    
    static func triggerSoftImpact() {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred(intensity: standardImpactIntensity)
    }
    
    static func triggerRigidImpact() {
        UIImpactFeedbackGenerator(style: .rigid).impactOccurred(intensity: standardImpactIntensity)
    }
}
