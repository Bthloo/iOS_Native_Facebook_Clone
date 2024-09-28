//
//  ShowCommentsVC.swift
//  Facebook UI
//
//  Created by Bthloo on 28/09/2024.
//

import UIKit

class ShowCommentsVC: UIViewController {
    
    var commentsList = [Comment]()
    
    var activityIndicator: UIActivityIndicatorView!
    var errorLBL : UILabel!
    var emptyListLBL : UILabel!
    var postID : Int!
    
    @IBOutlet weak var commentsTV: UITableView!
    
    
    @IBOutlet weak var addCommentTF: UITextField!
    
    
    @IBAction func sendBTN(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTV.delegate = self
        commentsTV.dataSource = self
        commentsTV.allowsSelection = false
        setupActivityIndicator()
        setupErrorLabel()
        setupEmptyListLabel()
        ApiManager.sharedService.commentDelegate = self
        getComments()
        // Do any additional setup after loading the view.
    }
    
    func getComments(){
        ApiManager.sharedService.getComments(postID: postID)
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
    
    func setupEmptyListLabel(){
        emptyListLBL = UILabel()
        emptyListLBL.textColor = .black
         // errorLBL.text = errorMSG
        emptyListLBL.textAlignment = .center
        emptyListLBL.frame = CGRect(x: 0, y: 0, width: 200, height: 50) // Set a frame with width and height
        emptyListLBL.numberOfLines = 0
        emptyListLBL.lineBreakMode = .byWordWrapping
        emptyListLBL.center = self.view.center // Positio
        self.view.addSubview(emptyListLBL)
    }
    

}


extension ShowCommentsVC : UITableViewDelegate,UITableViewDataSource, GetCommentsDelegate{
    func didFetchData(comments: CommentModel) {
        print("success")
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            if comments.comments.isEmpty{
                self.emptyListLBL.text = "There is no comments"
                
            }else{
                self.commentsList = comments.comments
                self.commentsTV.reloadData()
            }
            
           
           
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
        print("loading")
        DispatchQueue.main.async{
                    self.activityIndicator.startAnimating()
                }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCommentCell", for: indexPath) as! ShowCommentsCell
        
        cell.name.text = commentsList[indexPath.row].user.fullName
        cell.comment.text = commentsList[indexPath.row].body
        return cell
    }
    
    
    
}
