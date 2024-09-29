//
//  LoginVC.swift
//  Facebook UI
//
//  Created by Bthloo on 29/09/2024.
//

import UIKit

class LoginVC: UIViewController {
    
    
    var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var userNameLBL: UILabel!
    
    @IBOutlet weak var passwordLBL: UILabel!
    
    
    
    @IBOutlet weak var loginBTNOutLet: UIButton!
    
    @IBAction func loginBTN(_ sender: UIButton) {
        login()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiManager.sharedService.loginDelegate = self
        userNameLBL.text = ""
        passwordLBL.text = ""
        userNameTF.text = "michaelw"
        passwordTF.text = "michaelwpass"
        setupActivityIndicator()
        
    }
    
    
    func navigateToHomeScreen(){
        let homeScreenV = self.storyboard?.instantiateViewController(identifier: "CustTabBar") as! CustTabBar
        
        if var viewControllers = navigationController?.viewControllers {
            viewControllers.removeLast()
            viewControllers.append(homeScreenV)
            navigationController?.setViewControllers(viewControllers, animated: true)
        }
    }
    
   
    
    func login(){
        if userNameValidate() && passwordValidate() {
            ApiManager.sharedService.login(userName: userNameTF.text!, password: passwordTF.text!)
           
        }else{
            print("dont navigate")
        }
    }
    
    
    func userNameValidate()->Bool{
        userNameLBL.text = ""
        guard let userName = userNameTF.text else {
            userNameLBL.text = "user name must be more than 3 characters"
            return false
        }
        
        if userName.count <= 3 {
            userNameLBL.text = "user name must be more than 3 characters"
            return false
        }else{
            return true
        }
        
    }
    
    
    func passwordValidate()->Bool{
        passwordLBL.text = ""
        guard let password = passwordTF.text else {
            passwordLBL.text = "password must be more than 6 characters"
            return false
        }
        
        if password.count <= 6 {
            passwordLBL.text = "user name must be more than 6 characters"
            return false
        }else{
            return true
        }
        
    }
    
    func setupActivityIndicator() {
                activityIndicator = UIActivityIndicatorView(style: .large)
                activityIndicator.center = self.view.center
                activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
                self.view.addSubview(activityIndicator)
            }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension LoginVC : LoginDelegate{
    func success(loginModel: LoginModel) {
        UserDefaults.standard.set(loginModel.accessToken, forKey: "token")
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.loginBTNOutLet.isEnabled = true
            self.navigateToHomeScreen()
        }
        
    }
    
    func fail(error: (any Error)?) {
      

        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.loginBTNOutLet.isEnabled = true
            let alertDialog = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: .alert)
            alertDialog.addAction(UIAlertAction(title: "Ok", style: .default))
            
            self.present(alertDialog, animated: true)
        }
        
       
    }
    
    func loading() {
        DispatchQueue.main.async {
            self.loginBTNOutLet.isEnabled = false
            self.loginBTNOutLet.titleLabel?.text = "Loading"
            self.activityIndicator.startAnimating()
        }
    }
    
    
}
