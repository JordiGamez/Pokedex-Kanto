//
//  URLRequest+Headers.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import Foundation

extension URLRequest {
    
    mutating func addContentHeaders() {
        setValue(HttpConstants.HeaderValue.applicationJson, forHTTPHeaderField: HttpConstants.Header.contentType)
    }
}

extension URLRequest {
    
    mutating func addEncodedBody(withParams params: Encodable) {
        httpBody = try? JSONEncoder().encode(params)
    }
}
