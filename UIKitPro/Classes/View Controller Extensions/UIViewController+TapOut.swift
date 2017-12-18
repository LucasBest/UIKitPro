//
//  UIViewController+TapOut.swift
//  KeyboardMaster
//
//  Created by Lucas Best on 12/7/17.
//

import UIKit

extension UIViewController{
    @IBAction open func tapOut(_ sender:Any){
        self.view.endEditing(true)
    }
}
