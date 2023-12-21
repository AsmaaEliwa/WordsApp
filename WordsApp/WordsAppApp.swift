//
//  WordsAppApp.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import SwiftUI

@main
struct WordsAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
