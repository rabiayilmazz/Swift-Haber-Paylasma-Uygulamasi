//
//  UploadVC.swift
//  MobilApp
//
//  Created by Rabia on 25.05.2021.
//  Copyright © 2021 Rabia. All rights reserved.
//

import UIKit
import Firebase

class UploadVC: UIViewController {

    @IBOutlet weak var category: UISegmentedControl!
    
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        let title = titleTxt.text ?? ""
        let desc = descriptionTxt.text ?? ""
        let cat  = category.titleForSegment(at: category.selectedSegmentIndex)
        
        let currentUser = Auth.auth().currentUser
        
        if currentUser == nil {
            Common.showAllert(title: "Uyarı!!!", message: "Lütfen giriş yapınız", vc: self)
            
            return
        }
        
        let newItem: Dictionary <String,Any> = ["title": title, "desc": desc, "type": cat, " email": currentUser?.email]
        
        createNewItem(item: newItem)
    }
    
    func createNewItem(item: Dictionary<String, Any>){
        let firebaseNewItem = DataService.dataService.ITEM_REF.childByAutoId()
        
        firebaseNewItem.setValue(item){(error: Error?, DatabaseReference) -> Void in
            
            if error == nil{
                self.tabBarController?.selectedIndex = 0
                self.titleTxt.text = ""
                self.descriptionTxt.text = ""
                print("saved")
                
            }else{
                Common.showAllert(title: "hata", message: error?.localizedDescription ?? "error", vc: self)
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
