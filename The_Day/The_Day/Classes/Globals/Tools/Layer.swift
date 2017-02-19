//
//  Layer.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class Layer {
    
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
    
}
