//
//  TimelineCell.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/3/8.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {
    
    var index: IndexPath!
    weak var data: DayModel!
    
    // MARK: - Init
    
    var _deploy = true
    private func deploy(index: IndexPath, data: DayModel) {
        if _deploy {
            _deploy = false
        }
        self.index = index
        self.data = data
    }
    
    

}
