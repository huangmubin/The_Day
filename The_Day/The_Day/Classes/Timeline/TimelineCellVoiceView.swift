//
//  TimelineCellVoiceView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/24.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineCellVoiceView: UIView {

    
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
        
    }


}
