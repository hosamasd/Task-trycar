//
//  PostRowView.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI

struct PostRowView: View {
    var x = PostModel(userID: 0, id: 0, title: "", body: "")
    
    var body: some View {
       
                
            
        VStack (spacing:12){
            Text(x.title)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                
            
            Text(x.body)
                .font(.system(size: 12))
                .fontWeight(.regular)
                .foregroundColor(.gray.opacity(0.8))
                .lineLimit(3)
        }
        .padding(12)
        .frame(width:getFrameSize().width-32)
        .background(Color.green.opacity(0.5))
        .cornerRadius(12)
            
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView()
    }
}


