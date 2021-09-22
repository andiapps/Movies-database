//
//  HTTPClient.swift
//  MoviesDB
//
//  Created by Andy Wang on 12/07/2021.
//  Make request to OMDB URL and get JSON converted to model

import Foundation

enum NetworkError: Error { ///Define customised errors
    case badURL
    case noData
    case decodingError
}


class HTTPClient {
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        
        guard let url = URL.forMoviesByImdbId(imdbId) else {
            return completion(.failure(.badURL))
        }
        
        /** Considering the complexity of the app,  data is persisted by adopting URLSession's caching for simplicity. The data displayed will be updated automatically each time when
         user performs new search.
         */
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            ///Decode data from JSON
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.decodingError))
                
            }
            completion(.success(movieDetail))
        }.resume()
    }
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        
        guard let url = URL.forMoviesByName(search)
        else {
            return completion(.failure(.badURL))
        }
        
        ///Unwrapping data get root from JSON
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(moviesResponse.movies))
        }.resume()
    }
}
