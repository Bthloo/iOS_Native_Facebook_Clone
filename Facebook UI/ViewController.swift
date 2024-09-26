//
//  ViewController.swift
//  Facebook UI
//
//  Created by Bthloo on 26/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    var posts = [
        Users(name: "Bassel", post:"Any thoughts on why a UIButton with a boolean to toggle setting regular or bold font doesn't work via IBInspectable? It works for UILabel, but not UIButton. In my updateFont method (for UIButton subclass) I switch between regular and bold on self.titleLabel.font, but does not update in IB."),
        Users(name: "Bassel", post:"Not sure but that problem sounds familiar."),
        Users(name: "Bassel", post:"dsdjkjkds"),
        Users(name: "Bassel", post:"dsdjkjkds"),
        Users(name: "Bassel", post:"dsdjkjkds"),
        
    ]
    
    @IBOutlet weak var postsTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTV.dataSource = self
        postsTV.delegate = self
//        postsTV.estimatedRowHeight = 100
//        postsTV.rowHeight = UITableView.automaticDimension
      
    }


}


extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostViewCell
        cell.postText.text = posts[indexPath.row].post
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    

    
    
    
}

struct Users{
    let name : String
    let post : String
}
