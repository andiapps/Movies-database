//
//  MovieDetailView.swift
//  MoviesDB
//
//  Created by Andy Wang on 12/07/2021.
//  View responsible for showing details of the movie

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: movieDetailVM.poster)
                    .cornerRadius(10.0)
                Text(movieDetailVM.title)
                    .font(.title)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                Text(movieDetailVM.plot)
                Text("Director").fontWeight(.bold)
                Text(movieDetailVM.director)
                HStack {
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }.padding(.top, 10)
                Spacer()
            }.padding()
            
            .navigationBarTitle(self.movieDetailVM.title)
        }
    }
}

