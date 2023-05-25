//
//  GameTests.swift
//  readsheetTests
//
//  Created by fonbrot on 25/05/2023.
//

import XCTest
@testable import readsheet

class GameTests: XCTestCase {
    
    var game = Game()

    override func setUpWithError() throws {
        try super.setUpWithError()
        game = Game()
    }

    func testPressedWhenrRightKey() throws {
        let key = StaffKey.c
        game.pressed(key: key)
        XCTAssertEqual(game.rightAnswers, 1)
    }

    func testPressedWhenrWrongKey() throws {
        let key = StaffKey.d
        game.pressed(key: key)
        XCTAssertEqual(game.wrongAnswers, 1)
    }
    
}
