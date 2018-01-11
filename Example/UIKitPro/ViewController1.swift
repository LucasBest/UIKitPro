//
//  ViewController1.swift
//  UIKitPro
//
//  Created by Lucas Best on 12/07/2017.
//  Copyright (c) 2017 Lucas Best. All rights reserved.
//

import UIKit
import UIKitPro

class ViewController1: UIViewController {

    // MARK: - Actions
    
    @IBAction private func toViewController2(_ sender:UIButton){
        self.performSegue(withIdentifier: "toViewController2", sender: nil)
    }
}

