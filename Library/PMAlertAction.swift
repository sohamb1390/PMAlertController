//
//  PMAlertAction.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

public enum PMAlertActionStyle : Int {
    
    case Default
    case Cancel
}

public class PMAlertAction: UIButton {
    
    typealias CompletionHandler = ((PMAlertAction) -> Void)?
    
    var separator = UIImageView()
    
    public convenience init(title: String?, style: PMAlertActionStyle, handler: ((PMAlertAction) -> Void)?){
        self.init()
        
        self.setTitle(title, forState: UIControlState.Normal)
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 17)
        
         style == .Default ? (self.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)) : (self.setTitleColor(UIColor.lightGrayColor().colorWithAlphaComponent(0.5), forState: UIControlState.Normal))
       
        func callClosure() {
            
            handler!(self)
            
        }
        
        self.addTarget(self, action: Selector(callClosure()), forControlEvents: .TouchUpInside)
        
        
        self.addSeparator()
    }
    
    
    private func addSeparator(){
        separator.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(separator)
        
        // Autolayout separator
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.topAnchor.constraintEqualToAnchor(
            self.topAnchor).active = true
        separator.leadingAnchor.constraintEqualToAnchor(
            self.layoutMarginsGuide.leadingAnchor, constant: 8).active = true
        separator.trailingAnchor.constraintEqualToAnchor(
            self.layoutMarginsGuide.trailingAnchor, constant: -8).active = true
        separator.heightAnchor.constraintEqualToConstant(1).active = true
    }
    
    
    
}