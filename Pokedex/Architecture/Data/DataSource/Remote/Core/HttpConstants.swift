//
//  HttpConstants.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

enum HttpConstants {
    
    static var baseURL: String = BackendEnvironment.pro.url
    
    static var apiBaseURL: String {
        baseURL + "api/"
    }
}

extension HttpConstants {
    
    enum Method: String {
        
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
        case put = "PUT"
        case delete = "DELETE"
    }

    enum Header {
        
        static let contentType = "Content-Type"
        static let accept = "Accept"
        static let language = "Accept-Language"
        static let auth = "Authorization"
        static let deviceId = "Device-Id"
    }
    
    enum HeaderValue {
        
        static let applicationJson = "application/json"
        static let all = "*/*"
        
        static func bearer(withToken token: String) -> String { "Bearer \(token)" }
    }
}
