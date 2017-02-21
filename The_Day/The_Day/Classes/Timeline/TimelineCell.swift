//
//  TimelineCell.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {

    var data = [DataModel]()
    
    // MARK: - Deploy
    
    private var _deploy: Bool = true
    func deploy(_ data: [DataModel] = []) {
        self.data = data
        if _deploy {
            _deploy = false
            backgroundColor = UIColor.clear
            
            // Date Label
            dateLabel.font = UIFont.boldSystemFont(ofSize: 20)
            //dateLabel.textColor = UIColor.white
            addSubview(dateLabel)
            
            
        }
        
        update(date: data.first?.day)
    }
    
    
    // MARK: - Date Label
    
    let dateLabel = UILabel()
    
    func update(date value: String?) {
        dateLabel.text = value
        dateLabel.sizeToFit()
        dateLabel.frame.origin.x = 8
        dateLabel.frame.origin.y = 0
    }
    
    // MARK: - Day Label
    
    let dayLabel = UILabel()
    
    func update(day value: String?) {
        
    }
    
}
