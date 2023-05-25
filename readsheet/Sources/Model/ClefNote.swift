//
//  ClefNote.swift
//  readsheet
//
//  Created by fonbrot on 08.02.2022.
//

import Foundation

struct ClefNote: Equatable {
    
    let id: Int
    let clef: Clef
    let octave: Int
    let key: StaffKey
    let position: Int
    var sharp: Bool = false
    var flat: Bool = false
    
    func name(_ noteNames: NoteNames) -> String {
        key.name(noteNames) + "\(octave)"
    }
}

extension ClefNote {
    
    static let notes = trebleMainNotes + bassMainNotes + trebleSharpNotes + bassSharpNotes + flatNotes
    
    static let flatNotes = trebleFlatNotes + bassFlatNotes
    
    static let trebleMainNotes = [
        // 3
        ClefNote(id: 36, clef: .treble, octave: 3, key: .c, position: 27),
        ClefNote(id: 38, clef: .treble, octave: 3, key: .d, position: 26),
        ClefNote(id: 40, clef: .treble, octave: 3, key: .e, position: 25),
        ClefNote(id: 41, clef: .treble, octave: 3, key: .f, position: 24),
        ClefNote(id: 43, clef: .treble, octave: 3, key: .g, position: 23),
        ClefNote(id: 45, clef: .treble, octave: 3, key: .a, position: 22),
        ClefNote(id: 47, clef: .treble, octave: 3, key: .b, position: 21),
        
        // 4
        ClefNote(id: 48, clef: .treble, octave: 4, key: .c, position: 20),
        ClefNote(id: 50, clef: .treble, octave: 4, key: .d, position: 19),
        ClefNote(id: 52, clef: .treble, octave: 4, key: .e, position: 18),
        ClefNote(id: 53, clef: .treble, octave: 4, key: .f, position: 17),
        ClefNote(id: 55, clef: .treble, octave: 4, key: .g, position: 16),
        ClefNote(id: 57, clef: .treble, octave: 4, key: .a, position: 15),
        ClefNote(id: 59, clef: .treble, octave: 4, key: .b, position: 14),
        
        // 5
        ClefNote(id: 60, clef: .treble, octave: 5, key: .c, position: 13),
        ClefNote(id: 62, clef: .treble, octave: 5, key: .d, position: 12),
        ClefNote(id: 64, clef: .treble, octave: 5, key: .e, position: 11),
        ClefNote(id: 65, clef: .treble, octave: 5, key: .f, position: 10),
        ClefNote(id: 67, clef: .treble, octave: 5, key: .g, position: 9),
        ClefNote(id: 69, clef: .treble, octave: 5, key: .a, position: 8),
        ClefNote(id: 71, clef: .treble, octave: 5, key: .b, position: 7),
        
        // 6
        ClefNote(id: 72, clef: .treble, octave: 6, key: .c, position: 6),
        ClefNote(id: 74, clef: .treble, octave: 6, key: .d, position: 5),
        ClefNote(id: 76, clef: .treble, octave: 6, key: .e, position: 4),
        ClefNote(id: 77, clef: .treble, octave: 6, key: .f, position: 3),
        ClefNote(id: 79, clef: .treble, octave: 6, key: .g, position: 2),
        ClefNote(id: 81, clef: .treble, octave: 6, key: .a, position: 1),
        ClefNote(id: 83, clef: .treble, octave: 6, key: .b, position: 0),
    ]
    
    static let bassMainNotes = [
        // 1
        ClefNote(id: 12, clef: .bass, octave: 1, key: .c, position: 29),
        ClefNote(id: 14, clef: .bass, octave: 1, key: .d, position: 28),
        ClefNote(id: 16, clef: .bass, octave: 1, key: .e, position: 27),
        ClefNote(id: 17, clef: .bass, octave: 1, key: .f, position: 26),
        ClefNote(id: 19, clef: .bass, octave: 1, key: .g, position: 25),
        ClefNote(id: 21, clef: .bass, octave: 1, key: .a, position: 24),
        ClefNote(id: 23, clef: .bass, octave: 1, key: .b, position: 23),
        
        // 2
        ClefNote(id: 24, clef: .bass, octave: 2, key: .c, position: 22),
        ClefNote(id: 26, clef: .bass, octave: 2, key: .d, position: 21),
        ClefNote(id: 28, clef: .bass, octave: 2, key: .e, position: 20),
        ClefNote(id: 29, clef: .bass, octave: 2, key: .f, position: 19),
        ClefNote(id: 31, clef: .bass, octave: 2, key: .g, position: 18),
        ClefNote(id: 33, clef: .bass, octave: 2, key: .a, position: 17),
        ClefNote(id: 35, clef: .bass, octave: 2, key: .b, position: 16),
        
        // 3
        ClefNote(id: 36, clef: .bass, octave: 3, key: .c, position: 15),
        ClefNote(id: 38, clef: .bass, octave: 3, key: .d, position: 14),
        ClefNote(id: 40, clef: .bass, octave: 3, key: .e, position: 13),
        ClefNote(id: 41, clef: .bass, octave: 3, key: .f, position: 12),
        ClefNote(id: 43, clef: .bass, octave: 3, key: .g, position: 11),
        ClefNote(id: 45, clef: .bass, octave: 3, key: .a, position: 10),
        ClefNote(id: 47, clef: .bass, octave: 3, key: .b, position: 9),
        
        // 4
        ClefNote(id: 48, clef: .bass, octave: 4, key: .c, position: 8),
        ClefNote(id: 50, clef: .bass, octave: 4, key: .d, position: 7),
        ClefNote(id: 52, clef: .bass, octave: 4, key: .e, position: 6),
        ClefNote(id: 53, clef: .bass, octave: 4, key: .f, position: 5),
        ClefNote(id: 55, clef: .bass, octave: 4, key: .g, position: 4),
        ClefNote(id: 57, clef: .bass, octave: 4, key: .a, position: 3),
        ClefNote(id: 59, clef: .bass, octave: 4, key: .b, position: 2),
    ]
    
    static let trebleSharpNotes = [
        // 3
        ClefNote(id: 37, clef: .treble, octave: 3, key: .c1, position: 27, sharp: true),
        ClefNote(id: 39, clef: .treble, octave: 3, key: .d1, position: 26, sharp: true),
        ClefNote(id: 42, clef: .treble, octave: 3, key: .f1, position: 24, sharp: true),
        ClefNote(id: 44, clef: .treble, octave: 3, key: .g1, position: 23, sharp: true),
        ClefNote(id: 46, clef: .treble, octave: 3, key: .a1, position: 22, sharp: true),
        
        // 4
        ClefNote(id: 49, clef: .treble, octave: 4, key: .c1, position: 20, sharp: true),
        ClefNote(id: 51, clef: .treble, octave: 4, key: .d1, position: 19, sharp: true),
        ClefNote(id: 54, clef: .treble, octave: 4, key: .f1, position: 17, sharp: true),
        ClefNote(id: 56, clef: .treble, octave: 4, key: .g1, position: 16, sharp: true),
        ClefNote(id: 58, clef: .treble, octave: 4, key: .a1, position: 15, sharp: true),
        
        // 5
        ClefNote(id: 61, clef: .treble, octave: 5, key: .c1, position: 13, sharp: true),
        ClefNote(id: 63, clef: .treble, octave: 5, key: .d1, position: 12, sharp: true),
        ClefNote(id: 66, clef: .treble, octave: 5, key: .f1, position: 10, sharp: true),
        ClefNote(id: 68, clef: .treble, octave: 5, key: .g1, position: 9, sharp: true),
        ClefNote(id: 70, clef: .treble, octave: 5, key: .a1, position: 8, sharp: true),
        
        // 6
        ClefNote(id: 73, clef: .treble, octave: 6, key: .c1, position: 6, sharp: true),
        ClefNote(id: 75, clef: .treble, octave: 6, key: .d1, position: 5, sharp: true),
        ClefNote(id: 78, clef: .treble, octave: 6, key: .f1, position: 3, sharp: true),
        ClefNote(id: 80, clef: .treble, octave: 6, key: .g1, position: 2, sharp: true),
        ClefNote(id: 82, clef: .treble, octave: 6, key: .a1, position: 1, sharp: true),
    ]
    
    static let bassSharpNotes = [
        // 1
        ClefNote(id: 13, clef: .bass, octave: 1, key: .c1, position: 29, sharp: true),
        ClefNote(id: 15, clef: .bass, octave: 1, key: .d1, position: 28, sharp: true),
        ClefNote(id: 18, clef: .bass, octave: 1, key: .f1, position: 26, sharp: true),
        ClefNote(id: 20, clef: .bass, octave: 1, key: .g1, position: 25, sharp: true),
        ClefNote(id: 22, clef: .bass, octave: 1, key: .a1, position: 24, sharp: true),
        
        // 2
        ClefNote(id: 25, clef: .bass, octave: 2, key: .c1, position: 22, sharp: true),
        ClefNote(id: 27, clef: .bass, octave: 2, key: .d1, position: 21, sharp: true),
        ClefNote(id: 30, clef: .bass, octave: 2, key: .f1, position: 19, sharp: true),
        ClefNote(id: 32, clef: .bass, octave: 2, key: .g1, position: 18, sharp: true),
        ClefNote(id: 34, clef: .bass, octave: 2, key: .a1, position: 17, sharp: true),
        
        // 3
        ClefNote(id: 37, clef: .bass, octave: 3, key: .c1, position: 15, sharp: true),
        ClefNote(id: 39, clef: .bass, octave: 3, key: .d1, position: 14, sharp: true),
        ClefNote(id: 42, clef: .bass, octave: 3, key: .f1, position: 12, sharp: true),
        ClefNote(id: 44, clef: .bass, octave: 3, key: .g1, position: 11, sharp: true),
        ClefNote(id: 46, clef: .bass, octave: 3, key: .a1, position: 10, sharp: true),
        
        // 4
        ClefNote(id: 49, clef: .bass, octave: 4, key: .c1, position: 8, sharp: true),
        ClefNote(id: 51, clef: .bass, octave: 4, key: .d1, position: 7, sharp: true),
        ClefNote(id: 54, clef: .bass, octave: 4, key: .f1, position: 5, sharp: true),
        ClefNote(id: 56, clef: .bass, octave: 4, key: .g1, position: 4, sharp: true),
        ClefNote(id: 58, clef: .bass, octave: 4, key: .a1, position: 3, sharp: true)
    ]
    
    static let trebleFlatNotes = [
        // 3
        ClefNote(id: 37, clef: .treble, octave: 3, key: .c1, position: 26, flat: true),
        ClefNote(id: 39, clef: .treble, octave: 3, key: .d1, position: 25, flat: true),
        ClefNote(id: 42, clef: .treble, octave: 3, key: .f1, position: 23, flat: true),
        ClefNote(id: 44, clef: .treble, octave: 3, key: .g1, position: 22, flat: true),
        ClefNote(id: 46, clef: .treble, octave: 3, key: .a1, position: 21, flat: true),
        
        // 4
        ClefNote(id: 49, clef: .treble, octave: 4, key: .c1, position: 19, flat: true),
        ClefNote(id: 51, clef: .treble, octave: 4, key: .d1, position: 18, flat: true),
        ClefNote(id: 54, clef: .treble, octave: 4, key: .f1, position: 16, flat: true),
        ClefNote(id: 56, clef: .treble, octave: 4, key: .g1, position: 15, flat: true),
        ClefNote(id: 58, clef: .treble, octave: 4, key: .a1, position: 14, flat: true),
        
        // 5
        ClefNote(id: 61, clef: .treble, octave: 5, key: .c1, position: 12, flat: true),
        ClefNote(id: 63, clef: .treble, octave: 5, key: .d1, position: 11, flat: true),
        ClefNote(id: 66, clef: .treble, octave: 5, key: .f1, position: 9, flat: true),
        ClefNote(id: 68, clef: .treble, octave: 5, key: .g1, position: 8, flat: true),
        ClefNote(id: 70, clef: .treble, octave: 5, key: .a1, position: 7, flat: true),
        
        // 6
        ClefNote(id: 73, clef: .treble, octave: 6, key: .c1, position: 5, flat: true),
        ClefNote(id: 75, clef: .treble, octave: 6, key: .d1, position: 4, flat: true),
        ClefNote(id: 78, clef: .treble, octave: 6, key: .f1, position: 2, flat: true),
        ClefNote(id: 80, clef: .treble, octave: 6, key: .g1, position: 1, flat: true),
        ClefNote(id: 82, clef: .treble, octave: 6, key: .a1, position: 0, flat: true),
    ]
    
    static let bassFlatNotes = [
        // 1
        ClefNote(id: 13, clef: .bass, octave: 1, key: .c1, position: 28, flat: true),
        ClefNote(id: 15, clef: .bass, octave: 1, key: .d1, position: 27, flat: true),
        ClefNote(id: 18, clef: .bass, octave: 1, key: .f1, position: 25, flat: true),
        ClefNote(id: 20, clef: .bass, octave: 1, key: .g1, position: 24, flat: true),
        ClefNote(id: 22, clef: .bass, octave: 1, key: .a1, position: 23, flat: true),
        
        // 2
        ClefNote(id: 25, clef: .bass, octave: 2, key: .c1, position: 21, flat: true),
        ClefNote(id: 27, clef: .bass, octave: 2, key: .d1, position: 20, flat: true),
        ClefNote(id: 30, clef: .bass, octave: 2, key: .f1, position: 18, flat: true),
        ClefNote(id: 32, clef: .bass, octave: 2, key: .g1, position: 17, flat: true),
        ClefNote(id: 34, clef: .bass, octave: 2, key: .a1, position: 16, flat: true),
        
        // 3
        ClefNote(id: 37, clef: .bass, octave: 3, key: .c1, position: 14, flat: true),
        ClefNote(id: 39, clef: .bass, octave: 3, key: .d1, position: 13, flat: true),
        ClefNote(id: 42, clef: .bass, octave: 3, key: .f1, position: 11, flat: true),
        ClefNote(id: 44, clef: .bass, octave: 3, key: .g1, position: 10, flat: true),
        ClefNote(id: 46, clef: .bass, octave: 3, key: .a1, position: 9, flat: true),
        
        // 4
        ClefNote(id: 49, clef: .bass, octave: 4, key: .c1, position: 7, flat: true),
        ClefNote(id: 51, clef: .bass, octave: 4, key: .d1, position: 6, flat: true),
        ClefNote(id: 54, clef: .bass, octave: 4, key: .f1, position: 4, flat: true),
        ClefNote(id: 56, clef: .bass, octave: 4, key: .g1, position: 3, flat: true),
        ClefNote(id: 58, clef: .bass, octave: 4, key: .a1, position: 2, flat: true)
    ]
    
    static func noteByKey(note: ClefNote, key: StaffKey) -> ClefNote? {
        notes.first(where: {
            $0.clef == note.clef && $0.octave == note.octave && $0.key == key
        })
    }
    
    static func flatNoteByKey(note: ClefNote, key: StaffKey) -> ClefNote? {
        flatNotes.first(where: {
            $0.clef == note.clef && $0.octave == note.octave && $0.key == key
        })
    }
}

