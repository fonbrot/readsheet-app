//
//  readsheetApp.swift
//  readsheet
//
//  Created by fonbrot on 31.01.2022.
//

import SwiftUI

@main
struct readsheetApp: App {
    
    @AppStorage("colorMode") var colorMode: ColorMode = DefaultSettings.colorMode
    
    var body: some Scene {
        WindowGroup {
            LearnView()
                .preferredColorScheme(colorMode.getColorScheme())
                .environment(\.managedObjectContext,
                  PersistenceManager.shared.persistentContainer.viewContext)
        }
    }
}
