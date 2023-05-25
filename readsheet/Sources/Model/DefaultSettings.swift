//
//  DefaultSettings.swift
//  readsheet
//
//  Created by fonbrot on 16.02.2022.
//

import Foundation

struct DefaultSettings {
    
    static let clef: Clef = .both
    static let minTreble: Double = 0
    static let maxTreble: Double = 27
    static let minBass: Double = 0
    static let maxBass: Double = 27
    static let sharp: Bool = true
    static let flat: Bool = true
    static let noteNames: NoteNames = .english
    static let showNames: Bool = true
    static let duration: Double = 1
    static let pause: Double = 1
    static let noteSound: Bool = true
    static let responseSound: Bool = true
    static let colorMode: ColorMode = .automatic
}
