//
//  PostCommentRow.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI

struct PostCommentRow: View {
    var x = PostCommentsModel(postID: 1, id: 1, name: "", email: "", body: "")
    
    var body: some View {
       
                
            
        VStack (spacing:12){
            Text(x.name)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text(x.email)
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(.black.opacity(0.8))
            
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

struct PostCommentRow_Previews: PreviewProvider {
    static var previews: some View {
        PostCommentRow()
    }
}
