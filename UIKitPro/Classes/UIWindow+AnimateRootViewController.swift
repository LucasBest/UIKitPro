//
//  UIWindow+AnimateRootViewController.swift
//  UIKitPro
//
//  Created by Lucas Best on 12/5/17.
//

import UIKit

extension UIWindow {
    public func setRootViewController(_ rootViewController: UIViewController, animated: Bool = true) {
        if animated {
            let snapshot = self.snapshotView(afterScreenUpdates: true)

            if let realSnapshot = snapshot {
                rootViewController.view.addSubview(realSnapshot)
                realSnapshot.constrainInSuperview()
            }

            self.rootViewController = rootViewController

            UIView.animate(withDuration: 0.25, animations: {
                snapshot?.alpha = 0.0
                snapshot?.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }) { (_) in
                snapshot?.removeFromSuperview()
            }
        }
        else {
            self.rootViewController = rootViewController
        }
    }
}
