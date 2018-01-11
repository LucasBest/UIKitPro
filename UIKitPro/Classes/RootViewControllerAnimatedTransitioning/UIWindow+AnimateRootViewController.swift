//
//  UIWindow+AnimateRootViewController.swift
//  UIKitPro
//
//  Created by Lucas Best on 12/5/17.
//

import UIKit
import PinCushion

public extension UIWindow{
    public func setRootViewController(_ rootViewController:UIViewController, animated:Bool = true){
        if animated{
            let snapshot = self.snapshotView(afterScreenUpdates: true)
            
            if let realSnapShot = snapshot{
                rootViewController.view.addSubview(realSnapShot)
                realSnapShot.pinInSuperview([.leading, .top, .trailing, .bottom])
            }
            
            self.rootViewController = rootViewController
            
            UIView.animate(withDuration: 0.25, animations: {
                snapshot?.alpha = 0.0
                snapshot?.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }) { (complete) in
                snapshot?.removeFromSuperview()
            }
        }
        else{
            self.rootViewController = rootViewController
        }
    }
}
