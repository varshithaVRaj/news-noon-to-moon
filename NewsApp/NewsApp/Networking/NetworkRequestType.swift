//
//  Newtworking.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//
import Foundation
import SystemConfiguration
import Network

enum APIParameter: String {
    
    case contentType = "Content-Type"
    case language = "lang"
    case query = "q"
    case token = "token"
    
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


typealias HTTPHeaders = [String: String]

protocol NetworkRequestType {
    
    var baseUrl: URL { get }
    var path: String { get }
    var fullPath: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var queryParams: [String: String] { get }
    var headers: HTTPHeaders { get }
    
}

extension NetworkRequestType {
    
    var baseUrl: URL {
        guard let apiUrl = URL(string: APPEnvironment.shared.environment.baseApiUrl) else {
            fatalError("API base URL note configured.")
        }
        return apiUrl
    }
    
    var fullPath: String {
        return APPEnvironment.shared.environment.baseApiUrl + self.path
    }
}


extension NetworkRequestType {
    
    func asURLRequest() throws -> URLRequest {
        let requestURL: URL!
        // If condition checks if we have passed the Whole path or not
        if path.contains("http") {
            requestURL = try path.asURL()
        } else {
            requestURL = try baseUrl.absoluteString.appending(path).asURL()
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach({
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        })
        
        // Query Parameters
        if !queryParams.isEmpty {
            var queryItemArr: [URLQueryItem] = []
            for item in queryParams {
                queryItemArr.append(URLQueryItem(name: item.key, value: item.value))
            }
            request.url?.append(queryItems: queryItemArr)
        }
        
        // HTTP Post Parameters
        if let parameters = parameters, !parameters.isEmpty {
            let paramData = try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
            request.httpBody = paramData
        }
        
        return request
    }
}


extension String {
    func asURL() throws -> URL {
        guard let url = URL(string: self) else { throw NetworkError.invalidUrl(urlString: self) }
        return url
    }
}



