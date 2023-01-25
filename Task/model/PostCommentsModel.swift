//
//  PostDetailsComments.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI
struct PostCommentsModel: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
