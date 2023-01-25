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
@State var index=1
    
    var body: some View {
        VStack{
            
            HStack{
                Spacer()
                
               Text("Posts")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
                
                Button {
                    withAnimation{
                         changeRowNumber()
                    }
                } label: {
                    Image(systemName: "list.dash")
                }
                .padding(.trailing)


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
                
                if vm.postsArray.count  > 0{
                    
                    GeometryReader{mainView in
                        
                        ScrollView(.vertical,showsIndicators:false) {
                            LazyVGrid(columns: columns,spacing:24){
                                ForEach(vm.postsArray,id:\.id){index in
                                    GeometryReader{item in
                                        
                                        PostRowView(x: index)
                                            .onTapGesture {
                                                withAnimation{
                                                    vm.selectedPost=index
                                                    isShowDetails=true
                                                }
                                            }
                                        
                                        // scaling effect from bottom....
                                            .scaleEffect(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY),anchor: .top)
                                        
                                        // adding opacity effect...
                                        .opacity(Double(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY)))
                                        
                                    }
                                    // setting default frame height...
                                    .frame(height: 100)
                                }
                            }
                            .padding(.horizontal,16)
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
            
            let cachePostsCodabe: LocalJSONStore<[PostModel]> = LocalJSONStore(storageType: .cache, filename: "post.json")

            let arraysPosts = cachePostsCodabe.storedValue ?? []
            if arraysPosts.isEmpty {
                vm.getPosts()
            }else {
                vm.postsArray=arraysPosts
            }
            
//            vm.getPosts()
        }else{
            isConnected=false
        }
            
        }

    }
    
    // Simple Calculation for scaling Effect...
    
    func scaleValue(mainFrame : CGFloat,minY : CGFloat)-> CGFloat{
        
        // adding animation...
        
        withAnimation(.easeOut){
            
            // reducing top padding value...
            
            let scale = (minY - 25) / mainFrame
            
            // retuning scaling value to Album View if its less than 1...
            
            if scale > 1{
                
                return 1
            }
            else{
                
                return scale
            }
        }
    }
    
    func changeRowNumber()  {
        index =   index < 4 ? index+1 : 1
        columns=Array(repeating: GridItem(.flexible(), spacing: 12), count: index)
    }
}

struct PostsScene_Previews: PreviewProvider {
    static var previews: some View {
        PostsScene()
    }
}
