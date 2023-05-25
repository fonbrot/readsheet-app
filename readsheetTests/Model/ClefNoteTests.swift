//
//  ClefNoteTests.swift
//  readsheetTests
//
//  Created by fonbrot on 25/05/2023.
//

import XCTest
@testable import readsheet

class ClefNoteTests: XCTestCase {

    func testNotes() throws {
        XCTAssertEqual(ClefNote.notes.count, 136)
    }
    
    func testFlatNotes() throws {
        XCTAssertEqual(ClefNote.flatNotes.count, 40)
    }
    
    func testNoteByKey() throws {
        let note = ClefNote(id: 36, clef: .treble, octave: 3, key: .c, position: 27)
        let key = StaffKey.c
        let result = ClefNote.noteByKey(note: note, key: key)
        XCTAssertEqual(result?.id, 36)
    }
    
    func testFlatNoteByKey() throws {
        let note = ClefNote(id: 37, clef: .treble, octave: 3, key: .c1, position: 26, flat: true)
        let key = StaffKey.c1
        let result = ClefNote.flatNoteByKey(note: note, key: key)
        XCTAssertEqual(result?.id, 37)
    }

}
