//
//  DashboardViewModel.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

import Foundation
import UIKit

class DashboardViewModel{
    
    
    var articles: [Article]?
    var onNewsFetched: (([Article]) -> Void)?
    var onError: ((String) -> Void)?
    

    func getNews(for query: String) {
        let request = NewsAPI.searchNews(query: query)
        
        Networking.shared.request(request, type: NewsResponse.self, decodingType: .useDefaultKeys) { [weak self] result in
            switch result {
            case .success(let newsResponse):
                self?.articles = newsResponse.articles
                self?.onNewsFetched?(newsResponse.articles) // Notify the view controller
                
            case .failure(let error):
                let message: String
                if let err = error as? NetworkError {
                    switch err {
                    case .decodableFailure(let decodingError):
                        message = "Decoding Error: \(decodingError.localizedDescription)"
                    default:
                        message = "Network Error: \(err)"
                    }
                } else {
                    message = "Unknown Error: \(error.localizedDescription)"
                }
                self?.onError?(message)
            }
        }
    }
}





