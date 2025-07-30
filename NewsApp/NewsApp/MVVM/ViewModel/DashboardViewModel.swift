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
       var currentPage: Int = 1
       var isFetching: Bool = false
       var onNewsFetched: (([Article]) -> Void)?
       var onError: ((String) -> Void)?
    
    
    
   public func getNews(for query: String, page: Int) {
        guard !isFetching else { return }
        isFetching = true

        let request = NewsAPI.searchNews(query: query, page: page)
        
        Networking.shared.request(request, type: NewsResponse.self, decodingType: .useDefaultKeys) { [weak self] result in
            guard let self = self else { return }
            self.isFetching = false
            
            switch result {
            case .success(let newsResponse):
                if page == 1 {
                    self.articles = newsResponse.articles
                } else {
                    self.articles?.append(contentsOf: newsResponse.articles)
                }
                self.currentPage = page
                self.onNewsFetched?(self.articles ?? [])
                
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
                self.onError?(message)
            }
        }
    }
    
    public func loadNextPageIfNeeded(for query: String) {
        guard !isFetching else { return }
        let nextPage = currentPage + 1
        getNews(for: query, page: nextPage)
    }


}





