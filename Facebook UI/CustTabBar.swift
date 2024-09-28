//
//  CustTabBar.swift
//  Facebook UI
//
//  Created by Bthloo on 27/09/2024.
//

import UIKit

class CustTabBar: UITabBarController{
    
    
    @IBAction func addPostBTN(_ sender: UIBarButtonItem) {
        
        print("dss")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeNavCtrl()
        tabBar.barTintColor = .white
        navigationController?.navigationBar.barTintColor = .white
       
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
            titleLabel.textAlignment = .left
        titleLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
            navigationItem.titleView = titleLabel
    
      
    }
    
    
   

}
