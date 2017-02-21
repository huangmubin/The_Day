//
//  TimelineView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineView: UIView {

    weak var controller: TimelineController!
    var data: TimelineModel { return controller.data }
    
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
        // 0
        backgroundColor = Color.totalBackground
        
        
//        lineView.backgroundColor = UIColor.clear
//        lineView.layer.backgroundColor = UIColor.black.cgColor
//        addSubview(lineView)
//        Layouter(superview: self, view: lineView).leading(60).widthSelf(4).top().bottom()
        
        // TableView
        tableView.timeline = self
        tableView.frame = CGRect.screen.transform(y: 80)
        addSubview(tableView)
        
        
        header.frame = CGRect.screen.update(h: 80)
        addSubview(header)
    }
    
    // MARK: - Size
    
    override var frame: CGRect {
        didSet { update(bounds: bounds) }
    }
    
    override var bounds: CGRect {
        didSet { update(bounds: bounds) }
    }
    
    /** Update the bounds and didn't use autolayout's subView. */
    private func update(bounds: CGRect) {
        
    }
    
    // MARK: - LineView
    
    let lineView = UIView()
    
    // MARK: - TableView
    
    let tableView = TimelineTableView(frame: UIScreen.main.bounds)
    
    // MARK: - Header View
    
    let header = TimelineHeaderView()
    
}



