//
//  NYTTopStoriesAPIClient.swift
//  NYTTopStories
//
//  Created by Edward O'Neill on 2/7/20.
//  Copyright © 2020 Edward O'Neill. All rights reserved.
//

import Foundation
import NetworkHelper

struct NYTTopStoriesAPIClient {
    static func fetchTopStories(for section: String, complition: @escaping (Result<[Article], AppError>) -> ()) {
        let endpointURLString = "https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key="
        guard let url = URL(string: endpointURLString) else {
            complition(.failure(.badURL(endpointURLString)))
            return
        }
        
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                complition(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let topStories = try JSONDecoder().decode(TopStories.self, from: data)
                    complition(.success(topStories.results))
                } catch {
                    complition(.failure(.decodingError(error)))
                }
            }
        }
    }
}
