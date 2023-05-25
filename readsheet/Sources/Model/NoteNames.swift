//
//  NoteNames.swift
//  readsheet
//
//  Created by fonbrot on 06.02.2022.
//

import Foundation

enum NoteNames: Int, CaseIterable, Identifiable {
    
    // English
    case english
    // Russian
    case russian
    // German
    case german
    // Japanese
    case japanese
    // Japanese name
    case japanese1
    // Korean
    case korean
    // Korean name
    case korean1
    // Arabic
    case arabic
    // Italian
    case italian
    // French
    case french
    // Portuguese
    case portuguese
    // Greek
    case greek
    // Byzantine
    case byzantine
    // Hindustani
    case hindustani
    // Hindustani name
    case hindustani1
    // Carnatic
    case carnatic
    // Bengali
    case bengali
    
    var id: Self { self }
    
    var name: String {
        switch self {
        case .english:
            return "C D E F G A B"
        case .russian:
            return "До Ре Ми Фа Соль Ля Си"
        case .german:
            return "C D E F G A H"
        case .japanese:
            return "ハ ニ ホ ヘ ト イ ロ"
        case .japanese1:
            return "Ha Ni Ho He To I Ro"
        case .korean:
            return "다 라 마 바 사 가 나"
        case .korean1:
            return "Da Ra Ma Ba Sa Ga Na"
        case .arabic:
            return "دو ري مي فا صول لا سي"
        case .italian:
            return "Do Re Mi Fa Sol La Si"
        case .french:
            return "Do Ré Mi Fa Sol La Si"
        case .portuguese:
            return "Dó Ré Mi Fá Sol Lá Si"
        case .greek:
            return "Ντο Ρε Μι Φα Σολ Λα Σι"
        case .byzantine:
            return "Ni Pa Vu Ga Di Ke Zo"
        case .hindustani:
            return "सा रे ग म प ध नि"
        case .hindustani1:
            return "Sa Re Ga Ma Pa Dha Ni"
        case .carnatic:
            return "Sa Ri Ga Ma Pa Dha Ni"
        case .bengali:
            return "সা রে গ ম প ধ নি"
        }
    }
}
