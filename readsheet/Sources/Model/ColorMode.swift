//
//  ColorMode.swift
//  readsheet
//
//  Created by fonbrot on 06.02.2022.
//

import SwiftUI

enum ColorMode: Int, CaseIterable, Identifiable {
    
    case light, dark, automatic
    
    var id: Self { self }
    
    var name: String {
        switch self {
        case .light: return String(localized: "Light")
        case .dark: return String(localized: "Dark")
        case .automatic: return String(localized: "Automatic")
        }
    }
    
    func getColorScheme() -> ColorScheme? {
        switch self {
        case .light: return .light
        case .dark: return .dark
        case .automatic: return nil
        }
    }
}
