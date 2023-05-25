//
//  StaffView.swift
//  readsheet
//
//  Created by fonbrot on 01.02.2022.
//

import SwiftUI

struct StaffView: View {
    
    @Binding var challengeNote: ClefNote
    @Binding var pressedNote: ClefNote?
    
    private let lineHeight: CGFloat = 2
    private let spaceHeight: CGFloat = 24
    private let shortWidth: CGFloat = 50
    
    private let noteWidth: CGFloat = 40
    private let noteHeight: CGFloat = 25
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Colors.mainwhite)
                .frame(height: staffHeight)
            NoteView(noteColor: Colors.mainblack,
                     sharp: challengeNote.sharp,
                     flat: challengeNote.flat)
                .padding(.top, notePadding)
            if pressedNote != nil {
                NoteView(noteColor: pressedColor, sharp: pressedNote?.sharp ?? false, flat: pressedNote?.flat ?? false)
                    .padding(.top, pressedNotePadding)
            }
            if challengeNote.clef == .treble {
                HStack {
                    Image("treble")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Colors.mainblack)
                        .frame(width: 68)
                        .padding(.leading, 20)
                    Spacer()
                }
                .padding(.top, 104)
            } else {
                HStack {
                    Image("bass")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Colors.mainblack)
                        .frame(width: 70)
                        .padding(.leading, 20)
                    Spacer()
                }
                .padding(.top, 143)
            }
            VStack(spacing: spaceHeight) {
                ForEach((0...4), id: \.self) { _ in
                    Rectangle()
                        .fill(Colors.mainblack)
                        .frame(height: lineHeight)
                }
            }
            .padding(.top, halfHeight * 11)
            if showChallengeLines {
                VStack(spacing: spaceHeight) {
                    ForEach((1...lineCount(note: challengeNote)), id: \.self) { _ in
                        Rectangle()
                            .fill(Colors.mainblack)
                            .frame(width: shortWidth, height: lineHeight)
                    }
                }
                .padding(.top, lineTopPadding(note: challengeNote))
            }
            if showPressedLines {
                VStack(spacing: spaceHeight) {
                    ForEach((1...lineCount(note: pressedNote)), id: \.self) { _ in
                        Rectangle()
                            .fill(Colors.mainblack)
                            .frame(width: shortWidth, height: lineHeight)
                    }
                }
                .padding(.top, lineTopPadding(note: pressedNote))
            }
        }
    }
}

extension StaffView {
    
    private var staffHeight: CGFloat {
        halfHeight * 32
    }
    
    private var halfHeight: CGFloat {
        (lineHeight + spaceHeight) / 2
    }
    
    private var notePadding: CGFloat {
        CGFloat(challengeNote.position) * halfHeight - 13
    }
    
    private var pressedNotePadding: CGFloat {
        guard let pressedNote = pressedNote else {
            return 0
        }
        return CGFloat(pressedNote.position) * halfHeight - 13
    }
    
    private var showChallengeLines: Bool {
        challengeNote.position < 9 || challengeNote.position > 19
    }
    
    private var showPressedLines: Bool {
        guard let pressedNote = pressedNote else {
            return false
        }
        return pressedNote.position < 9 || pressedNote.position > 19
    }
    
    private var pressedLineCount: Int {
        guard let pressedNote = pressedNote else {
            return 0
        }
        if pressedNote.position < 9 {
            return (10 - challengeNote.position) / 2
        }
        if pressedNote.position > 19 {
            return (challengeNote.position - 18) / 2
        }
        return 0
    }
    
    private func lineCount(note: ClefNote?) -> Int {
        guard let note = note else {
            return 0
        }
        if note.position < 9 {
            return (10 - note.position) / 2
        }
        if note.position > 19 {
            return (note.position - 18) / 2
        }
        return 0
    }
    
    private func lineTopPadding(note: ClefNote?) -> CGFloat {
        guard let note = note else {
            return 0
        }
        if note.position < 9 {
            return halfHeight + CGFloat((5 - lineCount(note: note)) * 2) * halfHeight
        } else {
            return CGFloat(21) * halfHeight
        }
    }
    
    private var pressedColor: Color {
        pressedNote == challengeNote ? Colors.maingreen : Colors.mainred
    }
}

struct StaffView_Previews: PreviewProvider {
    @State static var challengeNote: ClefNote = ClefNote.trebleSharpNotes[2]
    @State static var pressedNote: ClefNote?
    
    static var previews: some View {
        StaffView(challengeNote: $challengeNote, pressedNote: $pressedNote)
    }
}
