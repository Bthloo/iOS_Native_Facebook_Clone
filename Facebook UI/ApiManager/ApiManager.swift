////
////  ApiManager.swift
////  Facebook UI
////
////  Created by Bthloo on 28/09/2024.
////
//
//import Foundation
//

import Foundation
class ApiManager{
    
    var postDelegate : GetPostsDelegate?
    var commentDelegate : GetCommentsDelegate?
    
    static let sharedService = ApiManager()
    
    func getPosts(){
        self.postDelegate?.loading()
        guard let url = URL(string: "https://dummyjson.com/posts")else{return}
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                self.postDelegate?.didFail(error: error)
                    return
                }else{
            
                    guard let data = data else {
                        self.postDelegate?.didFail(error: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                           return
                       }
                    do {
                            let postModel = try JSONDecoder().decode(PostModel.self, from: data) // 
                        self.postDelegate?.didFetchData(posts: postModel)
                        } catch {
                            self.postDelegate?.didFail(error: error)
                        }
            }
        }
        task.resume()
    }
    
    
    
    func getComments(postID : Int){

        self.commentDelegate?.loading()
        guard let url = URL(string: "https://dummyjson.com/posts/\(postID)/comments")else{return}
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                self.commentDelegate?.didFail(error: error)
                    return
                }else{
            
                    guard let data = data else {
                        self.commentDelegate?.didFail(error: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                           return
                       }
                    
                    
                    do {
                        let commentModel = try JSONDecoder().decode(CommentModel.self, from: data) //
                        self.commentDelegate?.didFetchData(comments: commentModel)
                        } catch {
                            self.commentDelegate?.didFail(error: error)
                        }
            }
            
            
        }
        task.resume()
    }
    
    
    
}



protocol GetPostsDelegate{
    func didFetchData(posts : PostModel)
    func didFail(error : Error?)
    func loading()
}

protocol GetCommentsDelegate{
    func didFetchData(comments : CommentModel)
    func didFail(error : Error?)
    func loading()
}

