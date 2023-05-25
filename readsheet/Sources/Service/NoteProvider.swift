//
//  NoteProvider.swift
//  readsheet
//
//  Created by fonbrot on 12.02.2022.
//

import SwiftUI

struct NoteProvider {
    
    @AppStorage("clef") var clef: Clef = DefaultSettings.clef
    @AppStorage("sharp") var sharp: Bool = DefaultSettings.sharp
    @AppStorage("flat") var flat: Bool = DefaultSettings.flat
    @AppStorage("minTreble") var minTreble: Double = DefaultSettings.minTreble
    @AppStorage("maxTreble") var maxTreble: Double = DefaultSettings.maxTreble
    @AppStorage("minBass") var minBass: Double = DefaultSettings.minBass
    @AppStorage("maxBass") var maxBass: Double = DefaultSettings.maxBass
    
    func getNotes() -> [ClefNote] {
        switch clef {
        case .treble:
            return trebleNotes.shuffled()
        case .bass:
            return bassNotes.shuffled()
        case .both:
            return (trebleNotes + bassNotes).shuffled()
        }
    }
    
    var trebleNotes: [ClefNote] {
        var notes = trebleMainNotes
        if sharp {
            notes += trebleSharpNotes
        }
        if flat {
            notes += trebleFlatNotes
        }
        return notes
    }
    
    var bassNotes: [ClefNote] {
        var notes = bassMainNotes
        if sharp {
            notes += bassSharpNotes
        }
        if flat {
            notes += bassFlatNotes
        }
        return notes
    }
    
    var trebleMainNotes: [ClefNote] {
        Array(ClefNote.trebleMainNotes[Int(minTreble)...Int(maxTreble)])
    }
    
    var bassMainNotes: [ClefNote] {
        Array(ClefNote.bassMainNotes[Int(minBass)...Int(maxBass)])
    }
    
    var trebleSharpNotes: [ClefNote] {
        ClefNote.trebleSharpNotes.filter {
            (trebleMinId...trebleMaxId).contains( $0.id )
        }
    }
    
    var bassSharpNotes: [ClefNote] {
        ClefNote.bassSharpNotes.filter {
            (bassMinId...bassMaxId).contains( $0.id )
        }
    }
    
    var trebleFlatNotes: [ClefNote] {
        ClefNote.trebleFlatNotes.filter {
            (trebleMinId...trebleMaxId).contains( $0.id )
        }
    }
    
    var bassFlatNotes: [ClefNote] {
        ClefNote.bassFlatNotes.filter {
            (bassMinId...bassMaxId).contains( $0.id )
        }
    }
    
    private var trebleMinId: Int {
        ClefNote.trebleMainNotes[Int(minTreble)].id
    }
    
    private var trebleMaxId: Int {
        ClefNote.trebleMainNotes[Int(maxTreble)].id
    }
    
    private var bassMinId: Int {
        ClefNote.bassMainNotes[Int(minBass)].id
    }
    
    private var bassMaxId: Int {
        ClefNote.bassMainNotes[Int(maxBass)].id
    }
}
