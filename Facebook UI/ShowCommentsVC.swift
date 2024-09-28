//
//  ShowCommentsVC.swift
//  Facebook UI
//
//  Created by Bthloo on 28/09/2024.
//

import UIKit

class ShowCommentsVC: UIViewController {
    
    
    @IBOutlet weak var commentsTV: UITableView!
    
    
    @IBOutlet weak var addCommentTF: UITextField!
    
    
    @IBAction func sendBTN(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTV.delegate = self
        commentsTV.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    

}


extension ShowCommentsVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCommentCell", for: indexPath) as! ShowCommentsCell
        
        cell.comment.text = comments[indexPath.row].commentContent
        cell.name.text = comments[indexPath.row].username
        return cell
    }
    
    
    
}


struct CommentModel {
    let username: String
    let commentContent: String
}



let comments: [CommentModel] = [
    CommentModel(username: "Alice", commentContent: "This is amazing!"),
    CommentModel(username: "Bob", commentContent: "I completely agree."),
    CommentModel(username: "Charlie", commentContent: "Interesting perspective."),
    CommentModel(username: "David", commentContent: "Can you explain more?"),
    CommentModel(username: "Eve", commentContent: "Thanks for sharing."),
    CommentModel(username: "Frank", commentContent: "This made my Your analysis is spot on! It rare to come across content that digs so deeply into the heart of the issue. I found myself thinking about this long after I finished reading.day."),
    CommentModel(username: "Grace", commentContent: "Not sure I agree."),
    CommentModel(username: "Hank", commentContent: "Well written!"),
    CommentModel(username: "Ivy", commentContent: "I have a question."),
    CommentModel(username: "Jack", commentContent: "Loved this content!"),
    CommentModel(username: "Kathy", commentContent: "This needs more attention."),
    CommentModel(username: "Leo", commentContent: "Fascinating read!"),
    CommentModel(username: "Mia", commentContent: "Could be better."),
    CommentModel(username: "Nina", commentContent: "Keep up the great work."),
    CommentModel(username: "Oscar", commentContent: "I'm learning so much."),
    CommentModel(username: "Paul", commentContent: "Please share more details."),
    CommentModel(username: "Quincy", commentContent: "Good point!"),
    CommentModel(username: "Rachel", commentContent: "I found this helpful."),
    CommentModel(username: "Steve", commentContent: "Not sure about this."),
    CommentModel(username: "Tina", commentContent: "This is insightful!")
]
