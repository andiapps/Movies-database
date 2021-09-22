//
//  Movie.swift
//  MoviesDB
//
//  Created by Andy Wang on 12/07/2021.
//  Creating a movie model which parses the movies' details from search API results

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable {
    
    let title: String
    let year: String
    let imdbId: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
