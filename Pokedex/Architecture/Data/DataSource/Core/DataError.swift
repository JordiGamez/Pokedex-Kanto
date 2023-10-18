//
//  DataError.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

enum DataError: Error, Equatable {
    
    case invalidUrl
    case encoding
    case decoding
    case badRequest
    case unauthorized
    case forbidden
    case server
    case maintenanceMode
    case network
    case notFound
    case conflict
    case tooManyRequests(retryAfterMiliseconds: Int?)
    case unknown
}
