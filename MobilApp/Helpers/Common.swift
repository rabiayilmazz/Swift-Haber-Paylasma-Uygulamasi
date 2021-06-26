//
//  Common.swift
//  MobilApp
//
//  Created by Rabia on 24.05.2021.
//  Copyright © 2021 Rabia. All rights reserved.
//

import Foundation
import UIKit

class Common: NSObject{
    class func showAllert(title: String, message: String, vc: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        vc.present(alert, animated: true, completion: nil)
    }
}
