//
//  ShowferApp.swift
//  Shared
//
//  Created by Dj Walker-Morgan on 15/10/2020.
//

import SwiftUI

@main
struct ShowferApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
