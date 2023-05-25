//
//  Game.swift
//  readsheet
//
//  Created by fonbrot on 12.02.2022.
//

import SwiftUI

class Game: ObservableObject {
    
    @AppStorage("duration") var duration: Double = DefaultSettings.duration
    @AppStorage("pause") var pause: Double = DefaultSettings.pause
    @AppStorage("noteSound") var noteSound: Bool = DefaultSettings.noteSound
    @AppStorage("responseSound") var responseSound: Bool = DefaultSettings.responseSound
    
    @Published var currentNote: ClefNote = ClefNote.trebleMainNotes[0]
    @Published var pressedNote: ClefNote?
    @Published var timeRemaining: Int = 0
    @Published var rightAnswers: Int = 0
    @Published var wrongAnswers: Int = 0
    @Published var active: Bool = true
    
    private var noteProvider: NoteProvider = NoteProvider()
    
    private var notes: [ClefNote] = []
    
    init() {
        setDuration()
        setNotes()
        setNewNote()
    }
    
    func pressed(key: StaffKey) {
        guard active else { return }
        if currentNote.flat, let note = ClefNote.flatNoteByKey(note: currentNote, key: key) {
            pressedNote = note
        } else {
            pressedNote = ClefNote.noteByKey(note: currentNote, key: key)
        }
        
        if responseSound, let pressedNote = pressedNote {
            AudioProvider.shared.play(note: pressedNote.id)
        }
        
        if key == currentNote.key {
            rightAnswers += 1
            PersistenceManager.shared.saveResult(right: true)
        } else {
            wrongAnswers += 1
            PersistenceManager.shared.saveResult(right: false)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(pause))) {
            self.pressedNote = nil
            self.setNewNote()
        }
    }
    
    private func setDuration() {
        timeRemaining = Int(duration) * 60
    }
    
    private func setRandomNote() {
        currentNote = notes.randomElement() ?? ClefNote.trebleMainNotes[0]
    }
    
    private func setNotes() {
        notes = noteProvider.getNotes()
    }
    
    private func playNoteSound() {
        if noteSound {
            AudioProvider.shared.play(note: currentNote.id)
        }
    }
    
    private func setNewNote() {
        self.setRandomNote()
        self.playNoteSound()
    }
}
