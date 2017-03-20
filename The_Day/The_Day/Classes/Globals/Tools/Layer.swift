//
//  Layer.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class Layer {
    
    /// 渐变色 Layer 图层
    class func gradient(points: (x1: CGFloat, y1: CGFloat, x2: CGFloat, y2: CGFloat) = (0,1,1,0), colors: [CGColor], locations: [NSNumber]? = nil) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: points.x1, y: points.y1)
        layer.endPoint   = CGPoint(x: points.x2, y: points.y2)
        layer.colors = colors
        if let locate = locations {
            layer.locations = locate
        } else if colors.count > 2 {
            var numbers: [CGFloat] = [0]
            let space = 1 / CGFloat(colors.count-1)
            for i in 0 ..< colors.count-2 {
                numbers.append(CGFloat(i) * space)
            }
            numbers.append(1)
        }
        return layer
    }
    
    /// 圆角 Layer
    class func rect(size: CGSize, a: CGFloat = 0, b: CGFloat = 0, c: CGFloat = 0, d: CGFloat = 0) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = rectanglePath(size: size, a: a, b: b, c: c, d: d).cgPath
        return layer
    }
    
    /// 圆角 Layer
    class func navigation(size: CGSize) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = rectanglePath(size: size, a: 8, b: 8, c: 0, d: 0).cgPath
        layer.fillColor = UIColor.white.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 1
        layer.shadowColor = UIColor(178,178,178).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        return layer
    }
    
    /// 路径
    class func rectanglePath(size: CGSize, a: CGFloat = 0, b: CGFloat = 0, c: CGFloat = 0, d: CGFloat = 0) -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: a))
        path.addArc(withCenter: CGPoint(x: a, y: a), radius: a, startAngle: CGFloat(M_PI), endAngle: CGFloat(M_PI_2) * 3, clockwise: true)
        
        path.addLine(to: CGPoint(x: size.width - b, y: 0))
        path.addArc(withCenter: CGPoint(x: size.width - b, y: b), radius: b, startAngle: CGFloat(M_PI_2) * 3, endAngle: CGFloat(M_PI_2) * 4, clockwise: true)
        
        path.addLine(to: CGPoint(x: size.width, y: size.height - c))
        path.addArc(withCenter: CGPoint(x: size.width - c, y: size.height - c), radius: c, startAngle: 0, endAngle: CGFloat(M_PI_2), clockwise: true)
        
        path.addLine(to: CGPoint(x: d, y: size.height))
        path.addArc(withCenter: CGPoint(x: d, y: size.height - d), radius: d, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(M_PI), clockwise: true)
        return path
    }
    
}
