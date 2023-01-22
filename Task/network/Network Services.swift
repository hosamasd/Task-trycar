//
//  Network Services.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI
import CoreData
class NetworkServices{
    static func getMethodGenerics<T:Codable>(urlString:String,completion:@escaping (T?,Error?)->Void)  {
            
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                if let err = err {
                    completion(nil, err)
                    return
                }
                do {
                    let objects = try JSONDecoder().decode(T.self, from: data!)
                    // success
                    completion(objects, err)
                } catch let error {
                    completion(nil, error)
                }
            }.resume()
        }
    
    static func getPosts(url:String,completion:@escaping ([PostModel]?,Error?)->Void)  {
        NetworkServices.getMethodGenerics(urlString: url, completion: completion)
    }
    
    static func getComments(url:String,completion:@escaping ([PostCommentsModel]?,Error?)->Void)  {

        NetworkServices.getMethodGenerics(urlString: url, completion: completion)
    }
}
