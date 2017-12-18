//
//  UIView+LayerStyle.swift
//  UIKitPro
//
//  Created by Lucas Best on 12/7/17.
//

import UIKit

@IBDesignable
public extension UIView{
    @IBInspectable public var cornerRadius:CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable public var borderWidth:CGFloat{
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var shadowOpacity:Float{
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable public var shadowOffset:CGSize{
        get{
            return self.layer.shadowOffset
        }
        set{
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable public var shadowRadius:CGFloat{
        get{
            return self.layer.shadowRadius
        }
        set{
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable public var borderColor:UIColor?{
        get{
            if let realColor = self.layer.borderColor{
                return UIColor(cgColor: realColor)
            }
            return nil
        }
        set{
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable public var shadowColor:UIColor?{
        get{
            if let realColor = self.layer.shadowColor{
                return UIColor(cgColor: realColor)
            }
            return nil
        }
        set{
            self.layer.shadowColor = newValue?.cgColor
        }
    }
}

