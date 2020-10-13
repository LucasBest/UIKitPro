//
//  RoundedButton.swift
//  UIKitPro
//
//  Created by Lucas Best on 10/13/20.
//

import UIKit

@IBDesignable
public class RoundedButton: UIButton, RoundableView {

    @IBInspectable var roundingAxisIB: String {
        get {
            return self.roundingAxis.rawValue
        }
        set {
            self.roundingAxis = RoundingAxis(rawValue: newValue) ?? .x
        }
    }

    public var roundingAxis: RoundingAxis = .x

    override public func layoutSubviews() {
        super.layoutSubviews()
        self.setCornerRadius()
    }
}
