//
//  UITextField+PlaceholderColor.swift
//  PinCushion
//
//  Created by Lucas Best on 1/17/18.
//

import UIKit

@IBDesignable
extension UITextField {
    @IBInspectable public var placeholderColor: UIColor {
        get {
            if let realAttributedPlaceholder = self.attributedPlaceholder {
                let attributes = realAttributedPlaceholder.attributes(at: 0, longestEffectiveRange: nil, in: NSRange(location: 0, length: realAttributedPlaceholder.string.count))

                if let realColor = attributes[.foregroundColor] as? UIColor {
                    return realColor
                }
            }

            return #colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8039215686, alpha: 1)
        }
        set {
            if let realPlaceholder = self.placeholder {
                 self.attributedPlaceholder = NSAttributedString(string: realPlaceholder, attributes: [.foregroundColor: newValue])
            }
        }
    }
}
