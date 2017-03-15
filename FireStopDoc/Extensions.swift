//
//  Extensions.swift
//  FireStopDoc
//
//  Created by Michael  de Boer on 3/15/17.
//  Copyright © 2017 MRB. All rights reserved.
//

import UIKit


@IBDesignable class ButtonCornerRadius: UIButton {
    @IBInspectable override var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
}

@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
    //let color : UIColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    @IBInspectable var borderColor: UIColor {
        get {
            let color = UIColor(cgColor: self.layer.borderColor!) //: UIColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
            return color
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    @IBInspectable var leftBorder: CGFloat {
        get {
            return 0.0
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: newValue, height: self.bounds.height))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = self.borderColor
            self.addSubview(line)
            
            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line(==lineWidth)]", options: [], metrics: metrics, views: views))
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[line]|", options: [], metrics: nil, views: views))
        }
    }
    
    @IBInspectable var topBorder: CGFloat {
        get {
            return 0.0
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: newValue))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = self.borderColor
            self.addSubview(line)
            
            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line]|", options: [], metrics: nil, views: views))
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[line(==lineWidth)]", options: [], metrics: metrics, views: views))
        }
    }
    
    @IBInspectable var rightBorder: CGFloat {
        get {
            return 0.0
        }
        set {
            let line = UIView(frame: CGRect(x: self.bounds.width, y: 0.0, width: newValue, height: self.bounds.height))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = self.borderColor
            self.addSubview(line)
            
            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "[line(==LineWidth)]|", options: [], metrics: metrics, views: views))
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[line]|", options: [], metrics: nil, views: views))
            
        }
    }
    @IBInspectable var bottomBorder: CGFloat {
        get {
            return 0.0
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: self.bounds.height, width: self.bounds.width, height: newValue))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = self.borderColor
            self.addSubview(line)
            
            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[line]|", options: [], metrics: nil, views: views))
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(==lineWidth)]|", options: [], metrics: metrics, views: views))
        }
    }
}
