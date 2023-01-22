//
//  SHomeTabBar.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI


class ContentViewViewModel: ObservableObject {
    
    //    @AppStorage("isShowMainApp") var isShowMainApp = false
    @AppStorage("isUserAddFingerOrFaceLogin") var isUserAddFingerOrFaceLogin = false
    @AppStorage("isBioShowed") var isBioShowed = false
    @Published var index=0

    
}
struct SHomeTabBar: View {
    init() {
        UITabBar.appearance().isHidden=true
    }
    @StateObject var vmm = ContentViewViewModel()
    
    @EnvironmentObject var vm:FavoriteViewModel//()

    
    var body: some View {
        TabView(selection: $vmm.index) {

            PostsScene()
            
                .frame(maxWidth:.infinity,maxHeight:.infinity)

                .environmentObject(vmm)
                .tag(0)
            
            FavoriteScene()
                .frame(maxWidth:.infinity,maxHeight:.infinity)

                .environmentObject(vmm)
                .tag(1)
            
           
            
        }
        .overlay(
        
           
        
            TabBar(index: $vmm.index)
                

            ,alignment: .bottom)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SHomeTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        SHomeTabBar()
    }
}


            struct CustomCurve: Shape {
                
                func path(in rect: CGRect) -> Path {

                return Path{path in
                    
                    path.move(to: CGPoint(x: 0, y: 0))
            //        path.addLine(to: CGPoint(x: 0, y: rect.height))
                    path.addLine(to: CGPoint(x: rect.width, y: 0))

                    path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                    path.addLine(to: CGPoint(x: 0, y: rect.height))
                    // adding Curve...
                    
                    let mid=rect.width/2
                    
                    
                    
                    path.move(to: CGPoint(x: 0, y: 0))//40
                    
//                    let to1=CGPoint(x: mid, y: 45)
//                    let control1 = CGPoint(x: mid-35, y: 0)
//                    let control2 = CGPoint(x: mid-35, y: 45)
//
//                    path.addCurve(to: to1, control1: control1, control2: control2)
//
//                    let to2=CGPoint(x: mid+70, y: 0)
//                    let control3 = CGPoint(x: mid+35, y: 45)
//                    let control4 = CGPoint(x: mid+35, y: 0)
//
//                    path.addCurve(to: to2, control1: control3, control2: control4)
            //        path.addArc(center: CGPoint(x: getFrameSize().width/2 , y: 0), radius: 42, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)

                  
                }
                }
            }
