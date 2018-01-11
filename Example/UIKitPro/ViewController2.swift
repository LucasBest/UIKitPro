//
//  ViewController2.swift
//  UIKitPro_Example
//
//  Created by Lucas Best on 1/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    // MARK: - Actions
    
    @IBAction private func goBack(_ sender:UIButton){
        self.performSegue(withIdentifier: "toViewController1", sender: nil)
    }
}
