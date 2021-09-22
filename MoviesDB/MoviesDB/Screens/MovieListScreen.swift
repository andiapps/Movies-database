//
//  MovieListScreen.swift
//  MoviesDB
//
//  Created by Andy Wang on 12/07/2021.
//
//New root screen

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListVM: MovieListViewModel //Make sure any data update will reflect on the UI
    @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            
            TextField("Enter a movie keyword", text: $movieName, onEditingChanged: {_ in}, onCommit: {
                ///Perform the search
                self.movieListVM.searchByName(self.movieName)
            }) .textFieldStyle(RoundedBorderTextFieldStyle())
            .accessibility(identifier: "searchTxt")
            Spacer()
                
                .navigationBarTitle("Movies")
            
            if self.movieListVM.loadingState == .success {
                MovieListView(movies: self.movieListVM.movies)
            } else if self.movieListVM.loadingState == .failed{
                SearchFailedView()
            } else if self.movieListVM.loadingState == .loading {
                LoadingView()
            }
        }.padding().embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
