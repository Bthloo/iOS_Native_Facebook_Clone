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
    var loginDelegate : LoginDelegate?
    var profileDelegate : GetProfileDelegate?
    
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
    
    
    
    func login(userName : String, password : String){
        
        loginDelegate?.loading()
        
        guard let url = URL(string: "https://dummyjson.com/user/login")else{return}
        let session = URLSession.shared
        let requestBody: [String: Any] = [
            "username": userName,
            "password": password
        ]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        }catch{
            print("json fail")
            self.loginDelegate?.fail(error: error)
        }
        
       
        let task = session.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                self.loginDelegate?.fail(error: error)
                return
            }else{
                guard let data = data else{
                    
                    self.loginDelegate?.fail(error: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                       return
                }
                
                do{
                    
                    
                    let loginModel = try JSONDecoder().decode(LoginModel.self, from: data)
                    
                    if loginModel.message != nil {
                        self.loginDelegate?.fail(error: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: loginModel.message!]))
                    }else{
                        self.loginDelegate?.success(loginModel: loginModel)
                    }
                    
                }catch{
                    self.loginDelegate?.fail(error: error)
                }
            }
            
        }
        task.resume()
        
    }
    
    
    func getProfile(token : String){
        
        self.profileDelegate?.loading()
        
        guard let url = URL(string: "https://dummyjson.com/user/me")else{return}
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { (data, response, error) in
          
            if let error = error {
                self.profileDelegate?.fail(error: error)
                return
            }else{
                guard let data = data else{
                    self.profileDelegate?.fail(error: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                    return
                }
                
                do{
                    
                    
                    let profileModel = try JSONDecoder().decode(ProfileModel.self, from: data)
                    
                    
                    if profileModel.message == nil{
                        self.profileDelegate?.success(profileModel: profileModel)
                    }else{
                        self.profileDelegate?.fail(error: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: profileModel.message!]))
                        return
                    }
                    
                    
                }catch{
                    self.profileDelegate?.fail(error: error)
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

protocol LoginDelegate{
    func success(loginModel : LoginModel)
    func fail(error : Error?)
    func loading()
}

protocol GetProfileDelegate{
    func success(profileModel : ProfileModel)
    func fail(error : Error?)
    func loading()
}

