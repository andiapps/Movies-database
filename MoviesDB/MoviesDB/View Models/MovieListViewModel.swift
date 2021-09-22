//
//  MovieListViewModel.swift
//  MoviesDB
//
//  Created by Andy Wang on 12/07/2021.
//

import Foundation
import SwiftUI

class MovieListViewModel: ViewModelBase { ///Control what's displayed on movie ListView
    
    @Published var movies = [MovieViewModel]()
    let httpClient = HTTPClient()
    
    func searchByName(_ name: String) {
        
        if name.isEmpty {return}
        
        self.loadingState = .loading
        
        httpClient.getMoviesBy(search: name.trimmedAndEscaped()) { result in
            switch result  {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
}

struct MovieViewModel { ///Provide data to view
    
    let movie: Movie
    
    var imdbId: String {
        movie.imdbId
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
}

