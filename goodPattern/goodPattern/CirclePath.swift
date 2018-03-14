//
//  CirclePath.swift
//  goodPattern
//
//  Created by Sky Xu on 11/7/17.
//  Copyright © 2017 Sky Xu. All rights reserved.
//

import Foundation
import UIKit

class CirclePath: UIView {
    
    let gLayer = CAGradientLayer()
    let shapeLayer = CAShapeLayer()
//    run the draw path func after the slide value changes(move the slide)
    var value: Float = 0 {
        didSet {
            drawPath()
        }
    }
    
    func drawPath() {
        shapeLayer.strokeEnd = CGFloat(value)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        /** for gradient layer
        */
//      when adding layer, the first one on the bottom , sec on top
        layer.addSublayer(gLayer)
//        this gLayer would fill the parent view
        gLayer.frame = bounds
        let red = UIColor.red.cgColor
        let yellow = UIColor.yellow.cgColor
        gLayer.colors = [red, yellow]
        gLayer.startPoint = CGPoint(x: 0, y: 0)
        gLayer.endPoint = CGPoint(x: 1, y: 1)
        /** for shape layer
        */
        layer.addSublayer(shapeLayer)
        let path = UIBezierPath()
        let cx = bounds.width / 2
        let cy = bounds.height / 2
        let c = CGPoint(x: cx, y: cy)
//        M_PI is a double so we need to convert it to float
        let pi2 = CGFloat(Double.pi * 2)
        let start = pi2 * 3 / 8
        let end = pi2 * 9 / 8
        
        path.addArc(withCenter: c, radius: cx - 10, startAngle: start, endAngle: end, clockwise: true)
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 10
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.strokeEnd = CGFloat(value)
//       line dash with 4 pint of line, 2 p of gap
        shapeLayer.lineDashPattern = [4, 2]
//        need to declare mask after draw the path so it would fill gradient with path
        gLayer.mask = shapeLayer
    }
//    this required init allows us to initialize circlepath class from storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
