//
//  PinCushion.swift
//  PinCushion
//
//  Created by Lucas Best on 12/1/17.
//

import Foundation

public struct DebugOptions: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let warnTranslatesAutoResizeMaskIntoConstraints = DebugOptions(rawValue: 1)
    public static let warnViewHasNoSuperview = DebugOptions(rawValue: 2)
}

public var debugOptions: DebugOptions = []
