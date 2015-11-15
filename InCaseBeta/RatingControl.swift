//
//  RatingControl.swift
//  InCaseBeta
//
//  Created by Javid Beykzadeh on 11/10/15.
//  Copyright © 2015 JavidCode. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.redColor()
        addSubview(button)
        
    }
}


func intrinsicContentSize() -> CGSize {
    return CGSize(width: 240, height: 44)
}