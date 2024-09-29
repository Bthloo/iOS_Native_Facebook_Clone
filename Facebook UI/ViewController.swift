//
//  ViewController.swift
//  Facebook UI
//
//  Created by Bthloo on 26/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    var postList = [Post]()
    var activityIndicator: UIActivityIndicatorView!
    var errorLBL : UILabel!
    
    
    @IBOutlet weak var postsTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       // self.edgesForExtendedLayout = [.top, .bottom]
        //changeNavCtrl()
        postsTV.estimatedRowHeight = 100
        postsTV.rowHeight = UITableView.automaticDimension
        postsTV.allowsSelection = false
        postsTV.dataSource = self
        postsTV.delegate = self
        setupActivityIndicator()
        setupErrorLabel()
        ApiManager.sharedService.postDelegate = self
        getPosts()
        
//        postsTV.estimatedRowHeight = 100
//        postsTV.rowHeight = UITableView.automaticDimension
      
    }
    
    
    
    
    func getPosts(){
        ApiManager.sharedService.getPosts()
        }


    
    
    func setupActivityIndicator() {
                activityIndicator = UIActivityIndicatorView(style: .large)
                activityIndicator.center = self.view.center
                activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
                self.view.addSubview(activityIndicator)
            }
        
        func setupErrorLabel(){
            errorLBL = UILabel()
            errorLBL.textColor = .black
             // errorLBL.text = errorMSG
            errorLBL.textAlignment = .center
                errorLBL.frame = CGRect(x: 0, y: 0, width: 200, height: 50) // Set a frame with width and height
            errorLBL.numberOfLines = 0
            errorLBL.lineBreakMode = .byWordWrapping
                errorLBL.center = self.view.center // Positio
            self.view.addSubview(errorLBL)
        }
    
}


extension ViewController : UITableViewDelegate,UITableViewDataSource,PostCellDelegate, GetPostsDelegate {
   
    func didFetchData(posts: PostModel) {
        
        print("success")
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.postList = posts.posts
            self.postsTV.reloadData()
        }
    }
    
    func didFail(error: (any Error)?) {
        
        print("fail")
        DispatchQueue.main.async{
                   self.activityIndicator.stopAnimating()
                   self.errorLBL.text = error?.localizedDescription
                   self.errorLBL.isHidden = false
               }
    }
    
    func loading() {
        
        DispatchQueue.main.async{
                    self.activityIndicator.startAnimating()
                }
    }
    
    func showComments(indexPath: IndexPath) {

        let showCommentVC =  self.storyboard?.instantiateViewController(withIdentifier: "ShowCommentVC") as! ShowCommentsVC
        
        showCommentVC.modalPresentationStyle = .pageSheet
        showCommentVC.modalTransitionStyle = .coverVertical
        showCommentVC.postID = postList[indexPath.row].id
        present(showCommentVC, animated: true, completion: nil)
       
    }
    
    
    func likePost(indexPath: IndexPath) {
        print("like at \(indexPath)")
        
       
        if self.postList[indexPath.row].isLiked{
            self.postList[indexPath.row].reactions.likes -= 1
        
        }else{
            self.postList[indexPath.row].reactions.likes += 1
            
        }
        
        self.postList[indexPath.row].isLiked = !self.postList[indexPath.row].isLiked
        self.postsTV.reloadRows(at: [indexPath], with: .automatic)

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostViewCell
       //
        cell.profileName.text = "user_" + String(postList[indexPath.row].userID)
        cell.postData.text = ""
        cell.postText.text = postList[indexPath.row].body
        cell.numberOfLikes.text = String(postList[indexPath.row].reactions.likes) + " likes"
        cell.numberOfComment.text = String(postList[indexPath.row].views) + " views"
       
        
        if postList[indexPath.row].isLiked {
            cell.likeBTNLBL.setTitle(" Liked", for: .normal)
           // cell.likeBTNLBL.setTitleColor(.tintColor, for: .normal)
            cell.likeBTNLBL.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        
            cell.likeBTNLBL.configuration?.baseForegroundColor = .systemBlue
            } else {
                cell.likeBTNLBL.setTitle(" Like", for: .normal)
               // cell.likeBTNLBL.setTitleColor(.gray, for: .normal)
                cell.likeBTNLBL.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
              
                cell.likeBTNLBL.configuration?.baseForegroundColor = .gray
            }
        cell.delegate = self
        cell.indexPath = indexPath
        
        return cell
    }
    
   
    

    
}

