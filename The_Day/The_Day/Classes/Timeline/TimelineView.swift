//
//  TimelineView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/3/7.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineView: UIView {

    weak var controller: TimelineController!
    
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
    
    private func deploy() {
        self.isUserInteractionEnabled = true
        
        // background
        self.backgroundColor = UIColor.black
        let sublayer = CALayer()
        sublayer.frame = bounds
        sublayer.cornerRadius = 8
        sublayer.backgroundColor = UIColor.white.cgColor
        self.layer.addSublayer(sublayer)
        
        // Header
        addSubview(header)
        header.timeline = self
        
        // TableView
        addSubview(tableview)
        tableview.timeline = self
    }
    
    // MARK: - Header
    
    let header = TimelineHeaderView()
    
    // MARK: - TableView
    
    let tableview = TimelineTableView()
}
