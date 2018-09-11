//
//  UIResponder+NextFocus.swift
//  UIKitPro
//
//  Created by Lucas Best on 12/8/17.
//

import UIKit

extension UIResponder{
    private struct AssociatedKeys {
        static var nextFocus = "nextFocus"
    }
    
    @IBOutlet open var nextFocus:UIResponder?{
        get{
            return objc_getAssociatedObject(self, &AssociatedKeys.nextFocus) as? UIResponder
        }
        set{
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.nextFocus, newValue,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    public func forwardToNextFocus(){
        self.nextFocus?.becomeFirstResponder()
        self.resignFirstResponder()
    }
}
