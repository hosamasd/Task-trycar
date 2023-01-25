//
//  TabBar.swift
//  Blue Bird
//
//  Created by hosam on 20/07/2022.
//

import SwiftUI

struct TabBar:View {
    
    @Binding var index:Int
    
    var body: some View {
        
        HStack {
            
            Spacer()
//            Spacer(minLength: 0)
            
            Button(action: {withAnimation{index=0}}, label: {
                
                VStack(spacing:2) {
                   
                    Text(LocalizedStringKey("Posts"))
                        .font(.system( size: 14))                         .fontWeight(index==0 ? .bold : .none)
                        .foregroundColor(.black)
                }
            })
            
            Spacer(minLength: 0)
            
            Button(action: {withAnimation{index=1}}, label: {
                VStack(spacing:2) {

                   
                
                Text(LocalizedStringKey("Favorites"))
                        .font(.system( size: 14))                         .fontWeight(index==1 ? .bold : .none)
                        .foregroundColor(.black)


                    
                }
            })
            
            Spacer()

           
            
        }
        .padding(.horizontal,16)//25
        .padding(.top,10)
        .frame(height:60)
//        .background(Color.red)
//        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
        
        .padding(.bottom, getSafeArea()!.bottom == 0 ? 0 : 20)
//
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
        
       
      
//        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: 5)

       

        //        .shadow(color: Color.gray.opacity(0.6), radius: 3)
//        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)

        
        
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        SHomeTabBar()
    }
}
