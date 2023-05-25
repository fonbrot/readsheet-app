//
//  Clef.swift
//  readsheet
//
//  Created by fonbrot on 05.02.2022.
//

import Foundation

enum Clef: Int, CaseIterable, Identifiable {
    case treble, bass, both
    
    var id: Self { self }
    
    var name: String {
        switch self {
        case .treble: return String(localized: "Treble")
        case .bass: return String(localized: "Bass")
        case .both: return String(localized: "Treble and bass")
        }
    }
}
