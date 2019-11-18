//
//  UIView+SubviewManagement.swift
//  PinCushion
//
//  Created by Lucas Best on 12/20/17.
//

import UIKit

extension UIView {
    public func removeAllSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }

    public func constrainInSuperview() {
        guard let superview = self.superview else {
            return
        }

        NSLayoutConstraint.activate([self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                                     self.topAnchor.constraint(equalTo: superview.topAnchor),
                                     self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                                     self.bottomAnchor.constraint(equalTo: superview.bottomAnchor)])
    }
}
