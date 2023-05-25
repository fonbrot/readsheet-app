//
//  StaffKey.swift
//  readsheet
//
//  Created by fonbrot on 06.02.2022.
//

import Foundation

enum StaffKey: Int, CaseIterable, Identifiable {
    
    case c, d, e, f, g, a, b, c1, d1, f1, g1, a1
    
    var id: Self { self }
    
    static let whiteKeys: [StaffKey] = [.c, .d, .e, .f, .g, .a, .b]
    static let blackKeys: [StaffKey] = [.c1, .d1, .f1, .g1, .a1]
    
    func name(_ noteNames: NoteNames) -> String {
        switch noteNames {
        case .english:
            switch self {
            case .c:
                return "C"
            case .d:
                return "D"
            case .e:
                return "E"
            case .f:
                return "F"
            case .g:
                return "G"
            case .a:
                return "A"
            case .b:
                return "B"
            default:
                return ""
            }
        case .russian:
            switch self {
            case .c:
                return "До"
            case .d:
                return "Ре"
            case .e:
                return "Ми"
            case .f:
                return "Фа"
            case .g:
                return "Соль"
            case .a:
                return "Ля"
            case .b:
                return "Си"
            default:
                return ""
            }
        case .german:
            switch self {
            case .c:
                return "C"
            case .d:
                return "D"
            case .e:
                return "E"
            case .f:
                return "F"
            case .g:
                return "G"
            case .a:
                return "A"
            case .b:
                return "H"
            default:
                return ""
            }
        case .japanese:
            switch self {
            case .c:
                return "ハ"
            case .d:
                return "ニ"
            case .e:
                return "ホ"
            case .f:
                return "ヘ"
            case .g:
                return "ト"
            case .a:
                return "イ"
            case .b:
                return "ロ"
            default:
                return ""
            }
        case .japanese1:
            switch self {
            case .c:
                return "Ha"
            case .d:
                return "Ni"
            case .e:
                return "Ho"
            case .f:
                return "He"
            case .g:
                return "To"
            case .a:
                return "I"
            case .b:
                return "Ro"
            default:
                return ""
            }
        case .korean:
            switch self {
            case .c:
                return "다"
            case .d:
                return "라"
            case .e:
                return "마"
            case .f:
                return "바"
            case .g:
                return "사"
            case .a:
                return "가"
            case .b:
                return "나"
            default:
                return ""
            }
        case .korean1:
            switch self {
            case .c:
                return "Da"
            case .d:
                return "Ra"
            case .e:
                return "Ma"
            case .f:
                return "Ba"
            case .g:
                return "Sa"
            case .a:
                return "Ga"
            case .b:
                return "Na"
            default:
                return ""
            }
        case .arabic:
            switch self {
            case .c:
                return "دو"
            case .d:
                return "ري"
            case .e:
                return "مي"
            case .f:
                return "فا"
            case .g:
                return "صول"
            case .a:
                return "لا"
            case .b:
                return "سي"
            default:
                return ""
            }
        case .italian:
            switch self {
            case .c:
                return "Do"
            case .d:
                return "Re"
            case .e:
                return "Mi"
            case .f:
                return "Fa"
            case .g:
                return "Sol"
            case .a:
                return "La"
            case .b:
                return "Si"
            default:
                return ""
            }
        case .french:
            switch self {
            case .c:
                return "Do"
            case .d:
                return "Ré"
            case .e:
                return "Mi"
            case .f:
                return "Fa"
            case .g:
                return "Sol"
            case .a:
                return "La"
            case .b:
                return "Si"
            default:
                return ""
            }
        case .portuguese:
            switch self {
            case .c:
                return "Dó"
            case .d:
                return "Ré"
            case .e:
                return "Mi"
            case .f:
                return "Fá"
            case .g:
                return "Sol"
            case .a:
                return "Lá"
            case .b:
                return "Si"
            default:
                return ""
            }
        case .greek:
            switch self {
            case .c:
                return "Ντο"
            case .d:
                return "Ρε"
            case .e:
                return "Μι"
            case .f:
                return "Φα"
            case .g:
                return "Σολ"
            case .a:
                return "Λα"
            case .b:
                return "Σι"
            default:
                return ""
            }
        case .byzantine:
            switch self {
            case .c:
                return "Ni"
            case .d:
                return "Pa"
            case .e:
                return "Vu"
            case .f:
                return "Ga"
            case .g:
                return "Di"
            case .a:
                return "Ke"
            case .b:
                return "Zo"
            default:
                return ""
            }
        case .hindustani:
            switch self {
            case .c:
                return "सा"
            case .d:
                return "रे"
            case .e:
                return "ग"
            case .f:
                return "म"
            case .g:
                return "प"
            case .a:
                return "ध"
            case .b:
                return "नि"
            default:
                return ""
            }
        case .hindustani1:
            switch self {
            case .c:
                return "Sa"
            case .d:
                return "Re"
            case .e:
                return "Ga"
            case .f:
                return "Ma"
            case .g:
                return "Pa"
            case .a:
                return "Dha"
            case .b:
                return "Ni"
            default:
                return ""
            }
        case .carnatic:
            switch self {
            case .c:
                return "Sa"
            case .d:
                return "Ri"
            case .e:
                return "Ga"
            case .f:
                return "Ma"
            case .g:
                return "Pa"
            case .a:
                return "Dha"
            case .b:
                return "Ni"
            default:
                return ""
            }
        case .bengali:
            switch self {
            case .c:
                return "সা"
            case .d:
                return "রে"
            case .e:
                return "গ"
            case .f:
                return "ম"
            case .g:
                return "প"
            case .a:
                return "ধ"
            case .b:
                return "নি"
            default:
                return ""
            }
        }
    }
}
