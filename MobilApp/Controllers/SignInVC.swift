//
//  SignIn.swift
//  MobilApp
//
//  Created by Rabia on 25.05.2021.
//  Copyright © 2021 Rabia. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        
        let pass = passwordText.text ?? ""
        let email = emailText.text ?? ""
        
        if pass.isEmpty || email.isEmpty{
            print("lütfen alanları doldurun")
            
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: pass){ (result, error) in
            if error != nil{
                print(error?.localizedDescription ?? "Error")
            }else{
                self.tabBarController?.selectedIndex = 0
            }
        }
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
