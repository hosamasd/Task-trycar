//
//  PostModel.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI

struct PostModel: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

