//
//  Headlines.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

import Foundation


enum NewsAPI {
    case searchNews(query: String, page: Int)
}

extension NewsAPI: NetworkRequestType {
    
    var parameters: [String : Any]? {
    
        return nil
    }
    
   
    var queryParams: [String : String] {
        switch self {
        case .searchNews(let query, let page):
            return [
                "\(APIParameter.query.rawValue)": query,
                "\(APIParameter.token.rawValue)": Constants.apiKey,
                "\(APIParameter.page.rawValue)": "\(page)"
                //  "\(APIParameter.language.rawValue)": "en",
            ]
        }
    }
    
//    var headers: HTTPHeaders {
//        return [:]
//    }
    
    var path: String {
        return Constants.hadlinesPath
    }
    
//    var category: String{
//        return Constants.generalCategoryAPI
//    }

    var method: HTTPMethod {
        return .get
    }
}
