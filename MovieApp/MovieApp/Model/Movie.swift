//
//  Movie.swift
//  MovieApp
//
//  Created by Romell Bolton on 7/22/21.
//

import Foundation

struct Movie: Codable, Identifiable {
    var popularity: Float
    var voteCount: Int
    var id: Int
    var voteAverage: Float
    var title: String
    var posterPath: String
    var originalLanguage: String
    var originalTitle: String
    var adult: Bool
    var overview: String
    var releaseDate: String
}
