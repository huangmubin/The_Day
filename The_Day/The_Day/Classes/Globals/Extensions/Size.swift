//
//  Size.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/21.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

// MARK: - CGRect

extension CGRect {
    
    static let screen: CGRect = UIScreen.main.bounds
    static let widthCenter: CGFloat = UIScreen.main.bounds.width / 2
    static let heightCenter: CGFloat = UIScreen.main.bounds.height / 2
    
    
    func center() -> CGPoint {
        return CGPoint(
            x: self.width / 2,
            y: self.height / 2
        )
    }
    
    func scale(_ v: CGFloat) -> CGRect {
        return CGRect(
            x: self.origin.x + v,
            y: self.origin.y + v,
            width: self.width - v * 2,
            height: self.height - v * 2
        )
    }
    
    func transform(x: CGFloat = 0, y: CGFloat = 0, w: CGFloat = 0, h: CGFloat = 0) -> CGRect {
        return CGRect(
            x: self.origin.x + x,
            y: self.origin.y + y,
            width: self.size.width + w - x,
            height: self.size.height + h - y
        )
    }
    
    func update(x: CGFloat? = nil, y: CGFloat? = nil, w: CGFloat? = nil, h: CGFloat? = nil) -> CGRect {
        return CGRect(
            x: x ?? self.origin.x,
            y: y ?? self.origin.y,
            width: w ?? self.size.width,
            height: h ?? self.size.height
        )
    }
    
    func offset(_ x: CGFloat, _ y: CGFloat) -> CGRect {
        return CGRect(
            x: self.origin.x + x,
            y: self.origin.y + y,
            width: self.size.width,
            height: self.size.height
        )
    }
    
}

