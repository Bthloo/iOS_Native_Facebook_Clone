//
//  ViewController.swift
//  Facebook UI
//
//  Created by Bthloo on 26/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    var posts = [Post]()
    
    @IBOutlet weak var postsTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = postList
       // self.edgesForExtendedLayout = [.top, .bottom]
        //changeNavCtrl()
        postsTV.estimatedRowHeight = 100
        postsTV.rowHeight = UITableView.automaticDimension
        postsTV.allowsSelection = false
        postsTV.dataSource = self
        postsTV.delegate = self
//        postsTV.estimatedRowHeight = 100
//        postsTV.rowHeight = UITableView.automaticDimension
      
    }
    
    
    
    func changeNavCtrl(){
        
        let titleFont = UIFont.boldSystemFont(ofSize: 24)
        let titleColor = UIColor.tintColor
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: titleFont,
                NSAttributedString.Key.foregroundColor: titleColor
            ]
            
            let titleLabel = UILabel()
            titleLabel.text = "Facebook"
            titleLabel.textColor = titleColor
            titleLabel.font = titleFont
          //  titleLabel.textAlignment = .left
        titleLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
            navigationItem.titleView = titleLabel
        //navigationController?.hidesBarsOnSwipe = true
    }


}


extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostViewCell
        cell.profileName.text = posts[indexPath.row].userName
        cell.postData.text = posts[indexPath.row].dateTime
        cell.postText.text = posts[indexPath.row].content
        cell.numberOfLikes.text = "\(posts[indexPath.row].reactions) likes"
        cell.numberOfComment.text = "\(posts[indexPath.row].comments.count) comments"
        cell.likeButtonAction = {
           
          
          
               }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(postList[indexPath.row].content)

    
    }
    

    
}


struct Comment {
    let commenterName: String
    let commentText: String
    var reactions: Int // Number of reactions to the comment
}

// Define a struct for Post with user name, comments, reactions, and date-time
struct Post {
    let id: Int
    let userName: String
    let content: String
    var comments: [Comment]
    var reactions: Int // Number of reactions to the post
    var dateTime: String // Date and time of the post
}




let postList: [Post] = [
    Post(
        id : 1,
        userName: "John Smith",
        content: "Why doesn't UIButton's font toggle work in Interface Builder?",
        comments: [
            Comment(commenterName: "Alice", commentText: "This is an interesting post!", reactions: 12),
            Comment(commenterName: "Bob", commentText: "I totally agree with you!", reactions: 8)
        ],
        reactions: 40,
        dateTime: "2024-09-27 10:30 AM"
    ),
    Post(
        id : 2,
        userName: "Jane Johnson",
        content: "What's the best way to debug a Swift crash?",
        comments: [
            Comment(commenterName: "Charlie", commentText: "Thanks for sharing!", reactions: 15),
            Comment(commenterName: "Dave", commentText: "Great explanation!", reactions: 7)
        ],
        reactions: 35,
        dateTime: "2024-09-27 11:15 AM"
    ),
    Post(
        id : 3,
        userName: "Alex Williams",
        content: "Has anyone worked with SwiftUI on macOS?\n Instruments: Use Xcode's Instruments (Time Profiler) to analyze the performance of your app while scrolling. Look for any spikes in CPU usage or blocking calls that could indicate where improvements can be made.",
        comments: [
            Comment(commenterName: "Emma", commentText: "Very informative post.", reactions: 20),
            Comment(commenterName: "Mike", commentText: "I learned something new today!", reactions: 10)
        ],
        reactions: 50,
        dateTime: "2024-09-27 12:00 PM"
    ),
    Post(
        id : 4,
        userName: "Emma Brown",
        content: "How to optimize Core Data queries in large datasets?",
        comments: [
            Comment(commenterName: "Sophia", commentText: "This cleared up my confusion.", reactions: 14),
            Comment(commenterName: "Chris", commentText: "Really helpful, thank you!", reactions: 5)
        ],
        reactions: 25,
        dateTime: "2024-09-27 1:30 PM"
    ),
    Post(
        id : 5,
        userName: "Chris Garcia",
        content: "Can someone explain how to use Combine in iOS?",
        comments: [
            Comment(commenterName: "Ava", commentText: "Good job explaining this.", reactions: 22),
            Comment(commenterName: "David", commentText: "I've been looking for this info.", reactions: 17)
        ],
        reactions: 55,
        dateTime: "2024-09-27 2:45 PM"
    ),
    Post(
        id : 6,
        userName: "Michael Davis",
        content: "Best practices for using Swift package manager?",
        comments: [
            Comment(commenterName: "Isabella", commentText: "Great question!", reactions: 10),
            Comment(commenterName: "Ethan", commentText: "I'm curious about that too.", reactions: 3)
        ],
        reactions: 30,
        dateTime: "2024-09-27 3:00 PM"
    ),
    Post(
        id : 7,
        userName: "Olivia Martinez",
        content: "Thoughts on the latest Swift update?",
        comments: [
            Comment(commenterName: "Lucas", commentText: "It's amazing!", reactions: 25),
            Comment(commenterName: "Mia", commentText: "I love the new features.", reactions: 12)
        ],
        reactions: 45,
        dateTime: "2024-09-27 4:15 PM"
    ),
    Post(
        id : 8,
        userName: "Sophia Garcia",
        content: "How to handle optional values in Swift?",
        comments: [
            Comment(commenterName: "Logan", commentText: "I have a few tips!", reactions: 9),
            Comment(commenterName: "Ella", commentText: "Great topic!", reactions: 14)
        ],
        reactions: 20,
        dateTime: "2024-09-27 5:30 PM"
    ),
    Post(
        id : 9,
        userName: "Liam Rodriguez",
        content: "Can we use generics in SwiftUI?",
        comments: [
            Comment(commenterName: "James", commentText: "Absolutely!", reactions: 5),
            Comment(commenterName: "Ava", commentText: "I'm learning about that now.", reactions: 3)
        ],
        reactions: 12,
        dateTime: "2024-09-27 6:00 PM"
    ),
    Post(
        id : 10,
        userName: "Noah Wilson",
        content: "Is it worth it to learn Swift for iOS development?",
        comments: [
            Comment(commenterName: "Chloe", commentText: "Definitely!", reactions: 16),
            Comment(commenterName: "Mason", commentText: "It's a great investment.", reactions: 20)
        ],
        reactions: 40,
        dateTime: "2024-09-27 7:15 PM"
    ),
    Post(
        id : 11,
        userName: "Emma Lee",
        content: "How do I start with CoreML in my iOS app?",
        comments: [
            Comment(commenterName: "Jack", commentText: "There are some great tutorials online.", reactions: 11),
            Comment(commenterName: "Lily", commentText: "I'd love to know too.", reactions: 6)
        ],
        reactions: 25,
        dateTime: "2024-09-27 8:30 PM"
    ),
    Post(
        id : 12,
        userName: "Ava Young",
        content: "What's your favorite third-party library for Swift?",
        comments: [
            Comment(commenterName: "Luke", commentText: "I love Alamofire!", reactions: 18),
            Comment(commenterName: "Zoe", commentText: "SnapKit is great for layout!", reactions: 9)
        ],
        reactions: 30,
        dateTime: "2024-09-27 9:45 PM"
    ),
    Post(
        id : 13,
        userName: "Charlotte Hall",
        content: "How do I manage dependencies in Swift projects?",
        comments: [
            Comment(commenterName: "Ella", commentText: "CocoaPods is popular.", reactions: 12),
            Comment(commenterName: "Aiden", commentText: "Try using Swift Package Manager.", reactions: 8)
        ],
        reactions: 22,
        dateTime: "2024-09-27 10:00 PM"
    ),
    Post(
        id : 14,
        userName: "James King",
        content: "Can I use Swift on the server side?",
        comments: [
            Comment(commenterName: "Nora", commentText: "Yes, it's quite powerful!", reactions: 14),
            Comment(commenterName: "Daniel", commentText: "I have tried it, and it's great.", reactions: 5)
        ],
        reactions: 35,
        dateTime: "2024-09-27 11:15 PM"
    ),
    Post(
        id : 15,
        userName: "Oliver Scott",
        content: "What are the differences between Swift and Objective-C?",
        comments: [
            Comment(commenterName: "Sofia", commentText: "Swift is much more modern.", reactions: 18),
            Comment(commenterName: "Henry", commentText: "I prefer Swift for new projects.", reactions: 12)
        ],
        reactions: 28,
        dateTime: "2024-09-27 12:30 AM"
    )
]
