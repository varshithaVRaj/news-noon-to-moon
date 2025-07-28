//
//  NetworkError.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

import Foundation


enum NetworkError: Error {
    case noInternet
    case badRequest
    case invalidUrl(urlString: String)
    case unauthorized
    case urlSessionFailed(_ error: URLError)
    case forbidden
    case notFound
    case serverError
    case decodableFailure(Error)
    case error4xx(_ code: Int)
    case error5xx(_ code: Int)
    case unknownError
}
