//
//  RootViewControllerAnimatedSegue.swift
//  UIKitPro
//
//  Created by Lucas Best on 12/5/17.
//

import UIKit

public class RootViewControllerAnimatedSegue: UIStoryboardSegue {
    public override func perform() {
        UIApplication.shared.keyWindow?.setRootViewController(self.destination)
    }
}
