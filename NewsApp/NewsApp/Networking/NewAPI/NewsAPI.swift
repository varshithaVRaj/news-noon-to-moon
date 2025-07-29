//
//  Headlines.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

import Foundation


enum NewsAPI {
    case searchNews(query: String)
}

extension NewsAPI: NetworkRequestType {
    
    var parameters: [String : Any]? {
    
        return nil
    }
    
    var queryParams: [String : String] {
        switch self {
        case .searchNews(let query):
            return [
                "\(APIParameter.catagory.rawValue)": query,
                "\(APIParameter.language.rawValue)": "en",
                "\(APIParameter.token.rawValue)": Constants.apiKey
            ]
        }
    }
    
    var headers: HTTPHeaders {
        return [
            "\(APIParameter.contentType)": Constants.contentType
        ]
    }
    
    var path: String {
        return Constants.hadlinesPath
    }
    
    var category: String{
        return Constants.generalCategoryAPI
    }

    var method: HTTPMethod {
        return .get
    }
}
