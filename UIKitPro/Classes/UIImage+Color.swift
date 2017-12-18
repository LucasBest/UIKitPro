//
//  UIImage+Color.swift
//  Cloosiv Merchant
//
//  Created by Lucas Best on 12/6/17.
//  Copyright © 2017 New Line Dev LLC. All rights reserved.
//

import UIKit

public extension UIImage{
    public class func imageWithColor(_ color:UIColor) -> UIImage?{
        let rect = CGRect(origin: CGPoint.zero, size: CGSize(width:1.0, height:1.0))
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
