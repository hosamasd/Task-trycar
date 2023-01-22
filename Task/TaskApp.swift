//
//  TaskApp.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI

@main
struct TaskApp: App {
//    let persistenceController = PersistenceController.shared
    @StateObject private var dataController = FavoriteViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
