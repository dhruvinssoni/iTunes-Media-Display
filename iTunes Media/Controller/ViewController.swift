//
//  ViewController.swift
//  iTunes Media
//
//  Created by Dhruvin Soni on 6/21/19.
//  Copyright © 2019 Dhruvin Soni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Constants
    let store = DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.getMusic {
            print("data fetched")
        }
        // Do any additional setup after loading the view.
    }


}

