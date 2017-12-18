//
//  UIView+Pinning.swift
//  PinCushion
//
//  Created by Lucas Best on 11/30/17.
//

import UIKit

public extension UIView{
    
    @discardableResult
    func pin(target:Any? = nil, _ targetAttribute:NSLayoutAttribute, to destination:Any? = nil, _ destinationAttribute:NSLayoutAttribute = .notAnAttribute, _ relation:NSLayoutRelation = .equal, multiplier:CGFloat = 1.0, constant:CGFloat = 0.0) -> (addedToView:UIView, constraint:NSLayoutConstraint){
        
        if PinCushion.debugOptions.contains(.warnTranslatesAutoResizeMaskIntoConstraints) && self.translatesAutoresizingMaskIntoConstraints{
            print("Warning: pinning view (", self, ") with .translatesAutoresizingMaskIntoConstraints set to true, constraints may conflict.")
        }
        
        let constraintTarget:Any = target ?? self
        
        let constraint = NSLayoutConstraint(item: constraintTarget, attribute: targetAttribute, relatedBy: relation, toItem: destination, attribute: destinationAttribute, multiplier: multiplier, constant: constant)
        
        var constraintView:UIView = self
        
        if let targetView = (constraintTarget as? UIView), let destinationView = destination as? UIView{
            targetView.translatesAutoresizingMaskIntoConstraints = false
            
            if let commonSuperview = targetView.commonSuperviewWith(destinationView){
                constraintView = commonSuperview
                commonSuperview.addConstraint(constraint)
            }
            else{
                self.addConstraint(constraint)
            }
        }
        else{
            self.translatesAutoresizingMaskIntoConstraints = false
            self.addConstraint(constraint)
        }
        
        return (constraintView, constraint)
    }
    
    @discardableResult
    func pinInSuperview(_ attrubutes:[NSLayoutAttribute], relation:NSLayoutRelation = .equal, multiplier:CGFloat = 1.0, constant:CGFloat = 0.0) -> [NSLayoutAttribute : NSLayoutConstraint]{
        if PinCushion.debugOptions.contains(.warnViewHasNoSuperview) && self.superview == nil{
            print("Warning: attempt to pin view to its superview when superview is nil, constraint will be added to self instead.")
        }
        
        var constraints = [NSLayoutAttribute : NSLayoutConstraint]()
        
        for attrubute in attrubutes{
            switch attrubute{
            case .trailing, .trailingMargin, .left, .leftMargin, .bottom, .bottomMargin:
                constraints[attrubute] =  self.superview?.pin(attrubute, to: self, attrubute, relation, multiplier: multiplier, constant: constant).constraint
            default:
                constraints[attrubute] =  self.pin(attrubute, to: self.superview, attrubute, relation, multiplier: multiplier, constant: constant).constraint
            }
        }
        
        return constraints
    }
}

extension UIView{
    func commonSuperviewWith(_ view:UIView) -> UIView?{
        let myHierachy = Set(self.viewHierarchy())
        let viewHierarchy = Set(view.viewHierarchy())
        
        return myHierachy.intersection(viewHierarchy).first
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


