//
//  SingUp.swift
//  MobilApp
//
//  Created by Rabia on 25.05.2021.
//  Copyright © 2021 Rabia. All rights reserved.
//

import UIKit
import Firebase

class SingUpVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        let pass = passwordText.text ?? ""
        let repeatPass = repeatPassword.text ?? ""
        let email = emailText.text ?? ""
      
        if pass.isEmpty || email.isEmpty || repeatPass != pass {
          print("lütfen alanları doldurun")
            Common.showAllert(title: "Bilgileri kontrol ediniz.", message: "Lütfen alanları dolsunuz", vc: self)
          
          return
        }
        createUser(email: email, password: pass)
    }
    
    func createUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){(result, error) in
            if error != nil{
                Common.showAllert(title: "Uyarı", message: error?.localizedDescription ?? "Kullanıcı oluşmadı" , vc: self)
            }else{
                _=self.navigationController?.popToRootViewController(animated: true)
            }
            
        }
    }

}
