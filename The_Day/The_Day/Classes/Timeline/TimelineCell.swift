//
//  TimelineCell.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {

    // MARK: - Deploy
    
    private var _deploy: Bool = true
    func deploy() {
        if _deploy {
            _deploy = false
            backgroundColor = UIColor.clear
            
            // Date Label
            dateLabel.font = UIFont.boldSystemFont(ofSize: 20)
            dateLabel.textColor = UIColor.white
            addSubview(dateLabel)
        }
    }
    
    // MARK: - Date Label
    
    let dateLabel = UILabel()
    
    func update(date value: String) {
        dateLabel.text = value
        dateLabel.sizeToFit()
        dateLabel.frame.origin.x = 8
        dateLabel.frame.origin.y = 0
    }

}
