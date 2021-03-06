//
//  TopStory.swift
//  NYTTopStories
//
//  Created by Edward O'Neill on 2/7/20.
//  Copyright © 2020 Edward O'Neill. All rights reserved.
//

import Foundation

struct TopStories: Codable {
  let section: String
  let lastUpdated: String
  let results: [Article]
  private enum CodingKeys: String, CodingKey {
    case section
    case lastUpdated = "last_updated"
    case results
  }
}

struct Article: Codable {
  let section: String
  let title: String
  let abstract: String
  let publishedDate: String
  let multimedia: [Multimedia]
  private enum CodingKeys: String, CodingKey {
    case section
    case title
    case abstract
    case publishedDate = "published_date"
    case multimedia
  }
}

struct Multimedia: Codable {
  let url: String
  let format: String
  let height: Double
  let width: Double
  let caption: String
}
