//
//  LoadingView.swift
//  MoviesDB
//
//  Created by Andy Wang on 12/07/2021.
//

import SwiftUI

struct LoadingView: View {
    
    @State var show = true
    var body: some View {
       Text("Loading.. Please wait....")
       .font(.largeTitle)
    }

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
}
