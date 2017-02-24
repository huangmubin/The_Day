//
//  TimelineCellNoteView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/24.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineCellNoteView: UIView {
    
    // MARK: - Init
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        deploy()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        deploy()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        deploy()
    }
    
    private func deploy() {
        self.layer.backgroundColor = UIColor(182,202,255).cgColor
        self.layer.cornerRadius = 6
        
        addSubview(label)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.left
    }
    
    // MARK: - Label
    
    let label = UILabel()
    
    func update(y: CGFloat, logs: [String]?) -> Bool {
        if let logs = logs {
            self.isHidden = false
            var value = ""
            for log in logs {
                value += "\(log)\n"
            }
            value.remove(at: value.index(before: value.endIndex))
            label.text = value
            label.sizeToFit()
            
            label.frame = CGRect(
                x: 8,
                y: 8,
                width: CGRect.screen.width - 96,
                height: label.frame.height
            )
            self.frame = CGRect(
                x: 72,
                y: y,
                width: CGRect.screen.width - 80,
                height: label.frame.height + 16
            )
            return true
        } else {
            self.isHidden = true
            return false
        }
    }
}
