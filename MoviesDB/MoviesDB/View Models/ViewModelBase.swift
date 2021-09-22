//
//  ViewModelBase.swift
//  MoviesDB
//
//  Created by Andy Wang on 12/07/2021.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none 
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
