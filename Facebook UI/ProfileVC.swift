//
//  ProfileVC.swift
//  Facebook UI
//
//  Created by Bthloo on 29/09/2024.
//

import UIKit

class ProfileVC: UIViewController {

    var activityIndicator: UIActivityIndicatorView!
    var errorLBL : UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var phoneNumber: UILabel!

    @IBOutlet weak var birthday: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    
    @IBOutlet weak var country: UILabel!
    
    let token = UserDefaults.standard.string(forKey: "token")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiManager.sharedService.profileDelegate = self
        setupActivityIndicator()
        setupErrorLabel()
        hideView()
        
        ApiManager.sharedService.getProfile(token: token ?? "")
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
    
    
    func hideView(){
        name.isHidden = true
        userName.isHidden = true
       email.isHidden = true
       phoneNumber.isHidden = true
       birthday.isHidden = true
        gender.isHidden = true
        country.isHidden = true
        errorLBL.isHidden = true
    }
    
    func showView(){
        name.isHidden = false
        userName.isHidden = false
       email.isHidden = false
       phoneNumber.isHidden = false
       birthday.isHidden = false
        gender.isHidden = false
        country.isHidden = false
    }
    

}


extension ProfileVC : GetProfileDelegate{
    func success(profileModel: ProfileModel) {
        print("profile success")
        DispatchQueue.main.async{
            if profileModel.image == nil{
                       
                       let errorImage =  UIImage(named: "error-icon")
                       
                self.profileImage.image = errorImage
                       
                   }else{
                       self.loadImage(from: profileModel.image!, imageView: self.profileImage)

                   }
            
            let firstName = profileModel.firstName ?? "No name "
            let middleName = profileModel.maidenName ?? ""
            let lastName = profileModel.lastName ?? " "
            self.activityIndicator.stopAnimating()
            self.name.text = "\(firstName) \(middleName) \(lastName)"
            self.userName.text = profileModel.username
            self.email.text = profileModel.email
            self.phoneNumber.text = profileModel.phone
            self.birthday.text = profileModel.birthDate
            self.gender.text = profileModel.gender
            self.country.text = profileModel.address?.country
            self.showView()
        }
    }
    
    func fail(error: (any Error)?) {
        print("profile fail")
        DispatchQueue.main.async{
            self.activityIndicator.stopAnimating()
            self.errorLBL.text = error?.localizedDescription
            self.errorLBL.isHidden = false
        }
    }
    
    func loading() {
        print("profile loading")
        DispatchQueue.main.async{
            self.activityIndicator.startAnimating()
        }
    }
    
    
    
    func loadImage(from urlString: String, imageView: UIImageView) {
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return
            }
            
          
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error fetching image: \(error)")
                    return
                }
                
                guard let data = data, let image = UIImage(data: data) else {
                    print("Error decoding image data")
                    return
                }
                
            
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
            
            task.resume()
        }
    
    
}
