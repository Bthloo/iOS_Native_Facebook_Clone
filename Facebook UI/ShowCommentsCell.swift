//
//  ShowCommentsCell.swift
//  Facebook UI
//
//  Created by Bthloo on 28/09/2024.
//

import UIKit

class ShowCommentsCell: UITableViewCell {
    
    @IBOutlet weak var commentContainer: UIView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var comment: UILabel!
    
    @IBAction func profilePic(_ sender: UIButton) {
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        commentContainer.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
