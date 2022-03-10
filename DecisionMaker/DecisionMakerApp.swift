//
//  DecisionMakerApp.swift
//  DecisionMaker
//
//  Created by Tim Yoon on 3/10/22.
//

import SwiftUI

@main
struct DecisionMakerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
