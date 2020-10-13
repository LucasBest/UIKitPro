//
//  RoundableView.swift
//  UIKitPro
//
//  Created by Lucas Best on 10/13/20.
//

import UIKit

public enum RoundingAxis: String {
    case x
    case y
}

public protocol RoundableView {
    var roundingAxis: RoundingAxis { get set }
}

extension RoundableView where Self: UIView {
    func setCornerRadius() {
        switch self.roundingAxis {
        case .x:
            self.cornerRadius = self.bounds.size.width / 2.0
        case .y:
            self.cornerRadius = self.bounds.size.height / 2.0
        }
    }
}
