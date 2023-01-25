//
//  PostCommentScene.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI
import CoreData

struct PostCommentScene: View {
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 1)
    //    @StateObject var vm=PostsViewModel()
    
    @ObservedObject var vm=PostsViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: []) var favorites: FetchedResults<Favorite>
    @State var isFav=false
    @EnvironmentObject var vmm:FavoriteViewModel//()

    var body: some View {
        VStack{
            
            HStack{
                Spacer()
                
                Button {
                    withAnimation{
                        print(123)
                        DispatchQueue.main.async {
                            isFav  ? deleteProducts() : addProduct()

                        }
                    }
                } label: {
                    Image(systemName: isFav ? "bookmark.fill" : "bookmark")
                        .renderingMode(.template)
                        .foregroundColor(Color.red)
                }
                
            }
            .padding()
            .padding(.top)
            
            if vm.postsCommentsArray.count == 0 {
                
                VStack{
                    Spacer()
                    
                    ProgressView()
                    Spacer()
                }
                
            }
            
            if vm.postsCommentsArray.count  > 0{

                ScrollView(.vertical,showsIndicators:false) {
                    LazyVGrid(columns: columns,spacing:24){
                        ForEach(vm.postsCommentsArray,id:\.id){index in
                            PostCommentRow(x:index)
                            //                        PostRowView(x: index)
                            
                        }
                    }

                }

            }
        }
        .onAppear{
            isFav=favorites.contains(where: {Int($0.id)==vm.selectedPost.id})

            vm.getComments(post: vm.selectedPost)
            
        }
    }
    
    
    
    private func addProduct() {
        
        withAnimation {
            let product = Favorite(context: viewContext)
            
            product.id = Double(vm.selectedPost.id ) ?? 0.0
            product.title=vm.selectedPost.title
            product.body=vm.selectedPost.body
            product.userID=Double(vm.selectedPost.userID)
            
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
            isFav.toggle()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
    
    private func deleteProducts() {

        withAnimation {
            let x = favorites.firstIndex(where: {$0.body == vm.selectedPost.body }) ?? 0


            let f = favorites[x]
            viewContext.delete(f)
            saveContext()
        }
    }
}

//struct PostCommentScene_Previews: PreviewProvider {
//    static var previews: some View {
//        PostCommentScene()
//    }
//}

