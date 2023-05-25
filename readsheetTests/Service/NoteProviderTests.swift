//
//  NoteProviderTests.swift
//  readsheetTests
//
//  Created by fonbrot on 25/05/2023.
//

import XCTest
@testable import readsheet

class NoteProviderTests: XCTestCase {
    
    var noteProvider = NoteProvider()

    override func setUpWithError() throws {
        try super.setUpWithError()
        noteProvider = NoteProvider()
    }

    override func tearDownWithError() throws {
        
    }

    func testGetNotes() throws {
        noteProvider.clef = .treble
        noteProvider.sharp = true
        noteProvider.minTreble = 0
        noteProvider.maxTreble = 3
        XCTAssertEqual(noteProvider.getNotes().count, 8)
    }

}
