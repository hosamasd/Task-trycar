//
//  PostsViewModel.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI
import CoreData

class PostsViewModel: ObservableObject {
   @Published var postsArray=[PostModel]()
    @Published var postsCommentsArray=[PostCommentsModel]()
@Published var selectedPost=PostModel(userID: 1, id: 1, title: "", body: "")
    @Published var isLoading=false
    
    func getPosts()  {
        let urlString = "https://jsonplaceholder.typicode.com/posts"//.toSecrueHttps()
        
        
        withAnimation{isLoading.toggle()}
    NetworkServices.getPosts(url:urlString) {[unowned self] (base, error) in
            if let err=error{
                           DispatchQueue.main.async {
                               withAnimation{isLoading.toggle()}

                           }
                       }
        
//
                       DispatchQueue.main.async {
                           withAnimation{isLoading.toggle()}

                           self.postsArray=base ?? []
                           
                       }
                   }
        }
    
    func getComments(post:PostModel)  {
        let path = "https://jsonplaceholder.typicode.com/posts/\(post.id)/comments"
        NetworkServices.getComments(url:path) {[unowned self] (base, error) in
                if let err=error{
                               DispatchQueue.main.async {
                                   withAnimation{isLoading.toggle()}

                               }
                           }
            
    //
                           DispatchQueue.main.async {
                               withAnimation{isLoading.toggle()}

                               self.postsCommentsArray=base ?? []
                           }
                       }
    }
    
    
}
