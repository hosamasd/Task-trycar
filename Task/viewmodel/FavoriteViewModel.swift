//
//  FavoriteViewModel.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI
import CoreData
import  Foundation

class FavoriteViewModel: ObservableObject {
    @Published var favoriteArray=[PostCommentsModel]()
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(entity: Favorite.entity(),
//               sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
//    private var products: FetchedResults<Favorite>
    
    
    let container = NSPersistentContainer(name: "Task")
    
    init() {
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                print("Core Data failed to load: \(error.localizedDescription)")
//            }
//        }
        container.loadPersistentStores { _, _ in }
    }
    
   
    
   
    
//
//     func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//     func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}
