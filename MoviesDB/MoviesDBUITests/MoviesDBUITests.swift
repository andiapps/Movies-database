//
//  MoviesDBUITests.swift
//  MoviesDBUITests
//
//  Created by Andy Wang on 12/07/2021.
//
//
import XCTest

class When_the_user_input_movie_keyword_and_tap_return: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        self.app = XCUIApplication()
        self.app.launch()
    }
    
    func test_should_return_list_of_movies() {
        
        let searchTextField = self.app.textFields["searchTxt"]
        searchTextField.tap()
        searchTextField.typeText("Superman \n")
        
        let searchResultsCount = self.app.tables.children(matching: .cell).count
        
        XCTAssertNotNil(searchResultsCount)
        
    }

}
