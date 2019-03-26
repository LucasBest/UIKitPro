//
//  UISearchBar+TextField.swift
//  UIKitPro
//
//  Created by Lucas Best on 2/2/18.
//

import UIKit

extension UISearchBar {
    public var textField: UITextField? {
        guard let searchField = self.value(forKey: "searchField") as? UITextField else {
            let allSubviews = self.subviews.flatMap({ (view) -> [UIView] in
                return view.subviews
            })

            return allSubviews.filter({ (view) -> Bool in
                return view is UITextField
            }).first as? UITextField
        }

        return searchField
    }
}
