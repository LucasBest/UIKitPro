//
//  UIView+SubviewManagement.swift
//  PinCushion
//
//  Created by Lucas Best on 12/20/17.
//

import UIKit

extension UIView{
    public func removeAllSubviews(){
        for subview in self.subviews{
            subview.removeFromSuperview()
        }
    }
}
