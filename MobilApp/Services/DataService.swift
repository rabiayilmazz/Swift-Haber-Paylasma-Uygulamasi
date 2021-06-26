//
//  DataService.swift
//  MobilApp
//
//  Created by Rabia on 24.05.2021.
//  Copyright © 2021 Rabia. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL="https://mobilapp-f7d53-default-rtdb.firebaseio.com/"

class DataService{
    static let dataService = DataService()
    
    private var _BASE_REF = Database.database().reference(fromURL: "\(BASE_URL)")
    private var _ITEM_REF = Database.database().reference(fromURL: "\(BASE_URL)/items")
    
    var BASE_REF: DatabaseReference{
        return _BASE_REF
    }
    
    var ITEM_REF: DatabaseReference{
        return _ITEM_REF
    }
    
}
