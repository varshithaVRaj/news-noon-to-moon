//
//  NewResponse.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

struct NewsResponse: Codable {
    let totalArticles: Int
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String?
    let url: String
    let image: String?
    let publishedAt: String
}
