//
//  RegisterVC.swift
//  Facebook UI
//
//  Created by Bthloo on 01/10/2024.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var firstNameValidator: UILabel!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var lastNameValidator: UILabel!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var emailValidator: UILabel!
    
    @IBOutlet weak var selectGenderMenu: UIButton!
    
    @IBOutlet weak var genderValidator: UILabel!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var passwordValidator: UILabel!
    
    @IBOutlet weak var rePasswordTF: UITextField!
    
    @IBOutlet weak var rePasswordValidator: UILabel!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        finalValidator()
    }
    
    
    @IBAction func loginBtnAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameValidator.text = ""
        lastNameValidator.text = ""
        emailValidator.text = ""
        genderValidator.text = ""
        passwordValidator.text = ""
        rePasswordValidator.text = ""
        initSelectGenderMenu()
        // Do any additional setup after loading the view.
    }
    
    
    
    func validateFirstName()->Bool{
        firstNameValidator.text = ""
        guard let firstName = firstNameTF.text else{
            firstNameValidator.text = "enter your first name"
            return false
        }
        
        if firstName.count <= 3 {
            firstNameValidator.text = "first name must be 4 characters at least"
            return false
        }else{
            return true
        }
        
       
    }
    
   func validateLastName()->Bool{
        lastNameValidator.text = ""
        guard let lastName = lastNameTF.text else{
            lastNameValidator.text = "enter your last name"
            return false
        }
        if lastName.count <= 3 {
            lastNameValidator.text = "last name must be 4 characters at least"
            return false
        }else{
            return true
        }
    }
    
    func validateEmail()->Bool{
         emailValidator.text = ""
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
         guard let  email =  emailTF.text else{
             emailValidator.text = "enter your email"
             return false
         }
        if  !emailPredicate.evaluate(with: email) {
             emailValidator.text = "enter a valid email"
             return false
         }else{
             return true
         }
     }
    
    func validatePassword()->Bool{
         passwordValidator.text = ""
         guard let password = passwordTF.text else{
             passwordValidator.text = "enter your password"
             return false
         }
         if password.count <= 5 {
             passwordValidator.text = "password must be 6 characters at least"
             return false
         }else{
             return true
         }
     }
    
    func validateRePassword()->Bool{
        rePasswordValidator.text = ""
        guard let password = passwordTF.text else{
            return false
        }
        guard let rePassword = rePasswordTF.text else {
            rePasswordValidator.text = "re enter your password"
            return false
        }
        if rePassword != password {
            rePasswordValidator.text = "re password doesn't match"
            return false
        }else{
            return true
        }
    }
    
    func validateGender()->Bool{
        genderValidator.text = ""
        guard let gender = selectGenderMenu.currentTitle else{
            genderValidator.text = "please select your gender"
            return false
        }
        if gender == "Select your gender"{
            genderValidator.text = "please select your gender"
            return false
        }else{
            return true
        }
      
    }
    
    
    func finalValidator(){
        if (!validateFirstName() || !validateLastName() || !validateEmail() || !validateGender() || !validatePassword() || !validateRePassword() ) {
            
            print("not validated")
        }else{
            print("validated")
        }
    }
    
    func initSelectGenderMenu(){
        selectGenderMenu.menu = UIMenu(
            title: "Choose your Gender",
            children: [
                UIAction(
                    title : "Male",
                    handler: { [weak selectGenderMenu] _ in
                        selectGenderMenu?.setTitle("Male", for: .normal)
                    }
                ),
                UIAction(
                    title : "Female",
                    handler: { [weak selectGenderMenu] _ in
                        selectGenderMenu?.setTitle("Female", for: .normal)
                    }
                ),
                UIAction(
                    title : "Prefer not to say",
                    handler: { [weak selectGenderMenu] _ in
                        selectGenderMenu?.setTitle("Prefer not to say", for: .normal)
                    }
                )
            ]
        )
        
        selectGenderMenu.showsMenuAsPrimaryAction = true
        selectGenderMenu.changesSelectionAsPrimaryAction = false
       
        
    }
   
    
}
