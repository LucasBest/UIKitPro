//
//  UIView+Pinning.swift
//  PinCushion
//
//  Created by Lucas Best on 11/30/17.
//

import UIKit

public extension UIView{
    
    @discardableResult
    func pin(target:Any? = nil, _ targetAttribute:NSLayoutConstraint.Attribute, to destination:Any? = nil, _ destinationAttribute:NSLayoutConstraint.Attribute = .notAnAttribute, _ relation:NSLayoutConstraint.Relation = .equal, multiplier:CGFloat = 1.0, constant:CGFloat = 0.0, priority:UILayoutPriority = .required, automaticallySetTranslatesAutoresizingMaskIntoConstraints:Bool = true) -> (addedToView:UIView, constraint:NSLayoutConstraint){
        
        if automaticallySetTranslatesAutoresizingMaskIntoConstraints{
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if PinCushion.debugOptions.contains(.warnTranslatesAutoResizeMaskIntoConstraints) && self.translatesAutoresizingMaskIntoConstraints{
            print("Warning: pinning view (", self, ") with .translatesAutoresizingMaskIntoConstraints set to true, constraints may conflict.")
        }
        
        let constraintTarget:Any = target ?? self
        
        let constraint = NSLayoutConstraint(item: constraintTarget, attribute: targetAttribute, relatedBy: relation, toItem: destination, attribute: destinationAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        
        var constraintView:UIView = self
        
        if let targetView = (constraintTarget as? UIView), let destinationView = destination as? UIView{
            if let commonSuperview = targetView.commonSuperviewWith(destinationView){
                constraintView = commonSuperview
                commonSuperview.addConstraint(constraint)
            }
            else{
                self.addConstraint(constraint)
            }
        }
        else{
            self.addConstraint(constraint)
        }
        
        return (constraintView, constraint)
    }
    
    @discardableResult
    func pinInSuperview(_ attrubutes:[NSLayoutConstraint.Attribute], relation:NSLayoutConstraint.Relation = .equal, multiplier:CGFloat = 1.0, constant:CGFloat = 0.0, priority:UILayoutPriority = .required, automaticallySetTranslatesAutoresizingMaskIntoConstraints:Bool = true) -> [NSLayoutConstraint.Attribute : NSLayoutConstraint]{
        if PinCushion.debugOptions.contains(.warnViewHasNoSuperview) && self.superview == nil{
            print("Warning: attempt to pin view to its superview when superview is nil, some constraints may not be added.")
        }
        
        var constraints = [NSLayoutConstraint.Attribute : NSLayoutConstraint]()
        
        for attrubute in attrubutes{
            switch attrubute{
            case .trailing, .trailingMargin, .left, .leftMargin, .bottom, .bottomMargin:
                if automaticallySetTranslatesAutoresizingMaskIntoConstraints{
                    self.translatesAutoresizingMaskIntoConstraints = false
                }
                
                if PinCushion.debugOptions.contains(.warnTranslatesAutoResizeMaskIntoConstraints) && self.translatesAutoresizingMaskIntoConstraints{
                    print("Warning: pinning view (", self, ") with .translatesAutoresizingMaskIntoConstraints set to true, constraints may conflict.")
                }
                
                let debugOptions = PinCushion.debugOptions
                PinCushion.debugOptions = []
                
                constraints[attrubute] =  self.superview?.pin(attrubute, to: self, attrubute, relation, multiplier: multiplier, constant: constant, priority:priority, automaticallySetTranslatesAutoresizingMaskIntoConstraints:false).constraint
                
                PinCushion.debugOptions = debugOptions
            default:
                constraints[attrubute] =  self.pin(attrubute, to: self.superview, attrubute, relation, multiplier: multiplier, constant: constant, priority:priority, automaticallySetTranslatesAutoresizingMaskIntoConstraints:
                    automaticallySetTranslatesAutoresizingMaskIntoConstraints).constraint
            }
        }
        
        return constraints
    }
}

extension UIView{
    func commonSuperviewWith(_ view:UIView) -> UIView?{
        let myHierachy = self.viewHierarchy().reversed()
        let viewHierarchy = view.viewHierarchy().reversed()
        
        for myView in myHierachy{
            for view in viewHierarchy{
                if myView == view{
                    return view
                }
            }
        }
        
        return nil
    }
    
    func viewHierarchy() -> [UIView]{
        if let realSuperview = self.superview{
            var viewHierarchy = realSuperview.viewHierarchy()
            viewHierarchy.append(self)
            
            return viewHierarchy
        }
        else{
            return [self]
        }
    }
}


