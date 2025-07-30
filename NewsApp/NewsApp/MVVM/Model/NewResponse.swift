//
//  NewResponse.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

struct NewsResponse: Codable {
    
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let image: String?
    let publishedAt: String?
    let content: String?
    
}
