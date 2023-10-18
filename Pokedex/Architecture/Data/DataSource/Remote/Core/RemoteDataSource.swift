//
//  RemoteDataSource.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//
// swiftlint:disable no_magic_numbers

import Foundation
import Combine

struct RemoteDataSource {
    
    private static let statusCodeOk = 200...299
    private static let statusCodeBadRequest = 400
    private static let statusCodeUnauthorized = 401
    private static let statusCodeForbidden = 403
    private static let statusCodeNotFound = 404
    private static let statusCodeConflict = 409
    private static let statusTooManyRequests = 429
    private static let statusCodeMaintenance = 503
    private static let statusCodeServerError = 500...599
    
    private init() {
        // Intentionally empty
    }
    
    static func run(_ urlRequest: URLRequest) -> AnyPublisher<Void, DataError> {
        URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap { _, response -> Void in
                try processResponse(response)
            }
            .mapError { $0 as? DataError ?? .unknown }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func run<D: Decodable>(_ urlRequest: URLRequest) -> AnyPublisher<D, DataError> {
        URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                try processResponse(response, data: data)
                return data
            }
            .decode(type: D.self, decoder: JSONDecoder())
            .mapError { $0 as? DataError ?? .decoding }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func runAndDecodeHeaders<H: Decodable>(_ urlRequest: URLRequest) -> AnyPublisher<H, DataError> {
        URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap { _, response -> Data in
                try processResponse(response)
                
                guard let response = response as? HTTPURLResponse
                else {
                    throw DataError.decoding
                }
                
                do {
                    return try JSONSerialization.data(withJSONObject: response.allHeaderFields, options: [])
                } catch {
                    throw DataError.decoding
                }
            }
            .decode(type: H.self, decoder: JSONDecoder())
            .mapError { $0 as? DataError ?? .decoding }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func runAndDecodeDataAndHeaders<D: Decodable, H: Decodable>(_ urlRequest: URLRequest) -> AnyPublisher<EntityWithHeaders<D, H>, DataError> {
        URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> EntityWithHeaders<D, H> in
                try processResponse(response, data: data)
                
                guard let response = response as? HTTPURLResponse else { throw DataError.decoding }
                do {
                    let headersData = try JSONSerialization.data(withJSONObject: response.allHeaderFields, options: [])
                    let decodedHeaders = try JSONDecoder().decode(H.self, from: headersData)
                    let decodedData = try JSONDecoder().decode(D.self, from: data)
                    
                    return EntityWithHeaders(data: decodedData, headers: decodedHeaders)
                } catch {
                    throw DataError.decoding
                }
            }
            .mapError { $0 as? DataError ?? .decoding }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

extension RemoteDataSource {
    
    static func processResponse(_ response: URLResponse, data: Data? = nil) throws {
        if let response: HTTPURLResponse = response as? HTTPURLResponse {
            if let error = checkStatusCodeFromResponse(response) { throw error }
        }
    }
    
    static func checkStatusCodeFromResponse(_ response: HTTPURLResponse) -> DataError? {
        var error: DataError?
        switch response.statusCode {
        case statusCodeOk:
            break
        case statusCodeBadRequest:
            error = .badRequest
        case statusCodeUnauthorized:
            error = .unauthorized
        case statusCodeForbidden:
            error = .forbidden
        case statusCodeNotFound:
            error = .notFound
        case statusCodeConflict:
            error = .conflict
        case statusTooManyRequests:
            error = .tooManyRequests(retryAfterMiliseconds: getRetryAfterMilisecondsFromResponse(response))
        case statusCodeMaintenance:
            error = .maintenanceMode
        case statusCodeServerError:
            error = .server
        default:
            error = .unknown
        }
        return error
    }
}

private extension RemoteDataSource {
    
    static func getRetryAfterMilisecondsFromResponse(_ response: HTTPURLResponse) -> Int? {
        Int(response.value(forHTTPHeaderField: "Retry-After") ?? "")
    }
}

// swiftlint:enable no_magic_numbers
