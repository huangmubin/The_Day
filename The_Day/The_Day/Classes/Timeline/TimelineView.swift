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
    
    /**
     视图配置: 
     0. 设置背景颜色和效果。
     1. TableView
     */
    private func deploy() {
        // 0
        backgroundColor = Color.totalBackground
        lineView.backgroundColor = UIColor.clear
        lineView.layer.backgroundColor = UIColor.black.cgColor
        addSubview(lineView)
        Layouter(superview: self, view: lineView).leading(60).widthSelf(4).top().bottom()
        
        
        // 1
        tableView.register(TimelineCell.self, forCellReuseIdentifier: "TimelineCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        addSubview(tableView)
        
        // 2
        addSubview(header)
        Layouter(superview: self, view: header).top().leading().trailing().heightSelf(40).constrants(last: {
            self.header.heightLayout = $0
        })
        
        Layouter(superview: self, view: tableView).bottom().leading().trailing().setViews(relative: header).layout(edge: .top, to: .bottom)
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
    
    let tableView = UITableView(frame: UIScreen.main.bounds)
    
    // MARK: - Header View
    
    let header = TimelineHeaderView()
    
}

// MARK: - TableView Delegate

extension TimelineView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller == nil ? 0 : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineCell", for: indexPath) as! TimelineCell
        cell.deploy()
        cell.update(date: data[indexPath.row][0].value)
        return cell
    }
    
}
