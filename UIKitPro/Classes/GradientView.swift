//
//  GradientView.swift
//  UIKitPro
//
//  Created by Lucas Best on 10/13/20.
//

import UIKit

/*
    https://stackoverflow.com/questions/23074539/programmatically-create-a-uiview-with-color-gradient
 */
@IBDesignable
public class GradientView: UIView {

    @IBInspectable public var start: CGPoint = .zero {
        didSet {
            self.gradientLayer.startPoint = start
        }
    }
    @IBInspectable public var end: CGPoint = CGPoint(x: 1, y: 1) {
        didSet {
            self.gradientLayer.endPoint = end
        }
    }

    @IBInspectable public var startColor: UIColor = .white {
        didSet {
            self.setColors()
        }
    }
    @IBInspectable public var endColor: UIColor = .black {
        didSet {
            self.setColors()
        }
    }

    private var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }

    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.setColors()
    }

    private func setColors() {
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
}
