//
//  TimelineHeaderView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineHeaderView: UIView {

    // MARK: - Height Layout
    
    var heightLayout: NSLayoutConstraint!

    // MARK: - Init
    
    init() {
        super.init(frame: UIScreen.main.bounds)
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
    
    /**
     视图配置:
     0. 设置背景颜色和效果。
     1. TableView
     */
    private func deploy() {
        // 0
        backgroundColor = Color.headerBackground
        layer.cornerRadius = 4
        layer.shadowOpacity = 0.8
    }
    
}
