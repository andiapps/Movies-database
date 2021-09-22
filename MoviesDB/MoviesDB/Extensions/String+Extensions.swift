//
//  String+Extensions.swift
//  MoviesDB
//
//  Created by Andy Wang on 12/07/2021.
//  Extension for the search bar. Whitespaces will be ignored when they are detected in the input so that search won't be affected by accidental whitespaces. 

import Foundation

extension String {
    
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return
            trimmedString
            .addingPercentEncoding(withAllowedCharacters:
                                    .urlHostAllowed) ?? self
    }
}
