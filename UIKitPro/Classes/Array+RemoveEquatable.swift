//
//  Array+RemoveHashable.swift
//  UIKitPro
//
//  Created by Lucas Best on 12/9/17.
//

import Foundation

public extension Array where Element: Equatable {
    mutating func remove(element: Element) {
        for index in 0..<self.count {
            if index < self.count {
                let existingElement = self[index]

                if existingElement == element {
                    self.remove(at: index)
                }
            }
            else {
                break
            }
        }
    }

    @discardableResult
    mutating func replace(element: Element) -> Element? {
        var returnElement: Element?

        for index in 0..<self.count {
            let existingElement = self[index]

            if existingElement == element {
                returnElement = existingElement
                self[index] = element
                break
            }
        }

        return returnElement
    }
}
