//
//  PostViewCell.swift
//  Facebook UI
//
//  Created by Bthloo on 26/09/2024.
//

import UIKit

class PostViewCell: UITableViewCell {

    @IBOutlet weak var profilePic: UIView!
    
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var postData: UILabel!
    
   
    
    @IBOutlet weak var postText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
//            NSLayoutConstraint.activate([
//                postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//                postText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//                postText.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 8),
//                postText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
//            ])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
