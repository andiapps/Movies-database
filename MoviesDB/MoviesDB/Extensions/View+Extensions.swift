//
//  View+Extensions.swift
//  MoviesDB
//
//  Created by Andy Wang on 12/07/2021.
//

import Foundation
import SwiftUI

extension View {
    
    func embedNavigationView() -> some View {
        return NavigationView{self}
    }
}
