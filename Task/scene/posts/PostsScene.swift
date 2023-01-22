//
//  PostsScene.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI

struct PostsScene: View {
    
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 1)
@StateObject var vm=PostsViewModel()
    @State var isConnected=true
    @State var isShowDetails=false
    @EnvironmentObject var vmm:FavoriteViewModel//()

    var body: some View {
        VStack{
            
            HStack{
                Spacer()
                
               Text("Posts")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                Spacer()

            }
            .padding()
//            .padding(.top)
            
            if !isConnected {
                VStack{
                    Spacer()
                    
                    ProgressView {
                        Text("No Internet avaiable!")
                    }
                    Spacer()
                }
                
            }else{
                
                if vm.postsArray.count == 0 {
                    
                    VStack{
                        Spacer()
                        
                        ProgressView()
                        Spacer()
                    }
                    
                }
//                if vm.postsArray.count == 0 && vm.isLoading==false{
//                    
//                    VStack{
//                        Spacer()
//                        
//                        Text("No Data Founded!")
//                             .font(.system(size: 20))
//                             .fontWeight(.bold)
//                        
//                        Spacer()
//                    }
//                    
//                }
                
                if vm.postsArray.count  > 0{
                    
                    
                    ScrollView(.vertical,showsIndicators:false) {
                        LazyVGrid(columns: columns,spacing:24){
                            ForEach(vm.postsArray,id:\.id){index in
                                
                                PostRowView(x: index)
                                    .onTapGesture {
                                        withAnimation{
                                            vm.selectedPost=index
                                            isShowDetails=true
                                        }
                                    }
                                
                            }
                        }
                    }
                    
                }
            }
            
            
        }
        .sheet(isPresented : $isShowDetails) {
            PostCommentScene(vm:vm)
                .environmentObject(vmm)
        }
        
        .onAppear{ if InternetConnectionManager.isConnectedToNetwork(){
            isConnected=true
            vm.getPosts()
        }else{
            isConnected=false
        }
            
        }

    }
}

struct PostsScene_Previews: PreviewProvider {
    static var previews: some View {
        PostsScene()
    }
}
