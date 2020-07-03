//
//  ColorView.swift
//  MyList
//
//  Created by Samuel Folledo on 6/27/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class ColorView: UIView {
    
    enum Shape {
        case round, square
    }
    
    var shape: Shape
    var color: UIColor
    var isFilled: Bool
    var height: CGFloat
    
    //init with parameters
    required init(shape: Shape, color: UIColor, isFilled: Bool, height: CGFloat) {
        self.shape = shape
        self.color = color
        self.isFilled = isFilled
        self.height = height
        super.init(frame: .zero)
        setupView()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = isFilled ? color : .clear
    }
    
    fileprivate func setupView() {
        layer.masksToBounds = true
        switch shape {
        case .round:
            layer.cornerRadius = height / 2
        case .square:
            layer.cornerRadius = 5
        }
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 5
        backgroundColor = isFilled ? color : .clear
    }
}
