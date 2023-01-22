//
//  FavoriteScene.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI
import CoreData

struct FavoriteScene: View {
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 1)
    @EnvironmentObject var vm:FavoriteViewModel//()
//    @FetchRequest(sortDescriptors: []) var favorite: FetchedResults<Favorite>

    @Environment(\.managedObjectContext) private var viewContext
       
//       @FetchRequest(entity: Favorite.entity(), sortDescriptors: [])
//       private var products: FetchedResults<Favorite>
    @FetchRequest(sortDescriptors: []) var favorites: FetchedResults<Favorite>

    var body: some View {
        VStack{
            
            HStack{
                Spacer()
                
               Text("Favorites")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                Spacer()

            }
            .padding()
//            .padding(.top)
            
            if favorites.count == 0 {
                
                VStack{
                    Spacer()
                    
                    Text("No Data Founded!")
                         .font(.system(size: 20))
                         .fontWeight(.bold)
                    
                    Spacer()
                }
                
            }
            
            if favorites.count > 0 {
                List {
//                ScrollView(.vertical,showsIndicators:false) {
//                    LazyVGrid(columns: columns,spacing:24){
                        ForEach(favorites,id:\.id){index in
                            var product = PostModel(userID: Int(index.userID), id: Int(index.id), title: index.title ?? "", body: index.body ?? "")
                            FavoriteRowView(x: product)
                            //                        PostRowView(x: index)
                            
                        }
                        .onDelete(perform: deleteProducts)

//                    }
                }
            }
        }
            
        
    }
    
   
       
       private func saveContext() {
           do {
               try viewContext.save()
           } catch {
               let error = error as NSError
               fatalError("An error occured: \(error)")
           }
       }
    
    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            offsets.map { favorites[$0] }.forEach(viewContext.delete)
                saveContext()
            }
    }
}

struct FavoriteScene_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScene()
    }
}
