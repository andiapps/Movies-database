//
//  MovieListView.swift
//  MoviesDB
//
//  Created by Andy Wang on 12/07/2021.
//  Responsible for displaying all search results movies

import SwiftUI

struct MovieListView: View {
    
    let movies: [MovieViewModel]
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            ///Navigating from any movie cell to movie detail screen
            NavigationLink(
                destination: MovieDetailScreen(imdbId: movie.imdbId)) {
                MovieCellView(movie: movie)
            }
        }
    }
}


struct MovieCellView: View {
    
    let movie: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6.0)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
