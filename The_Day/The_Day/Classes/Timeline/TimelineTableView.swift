//
//  TimelineTableView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/20.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - TableView
    
    weak var timeline: TimelineView!
    var data: TimelineModel { return timeline!.data }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        deploy()
    }
    
    override init(frame: CGRect, style: UITableViewStyle = UITableViewStyle.plain) {
        super.init(frame: frame, style: style)
        deploy()
    }
    
    private func deploy() {
        register(TimelineCell.self, forCellReuseIdentifier: "TimelineCell")
        separatorStyle = .none
        backgroundColor = UIColor.clear
        
        dataSource = self
        delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeline == nil ? 0 : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineCell", for: indexPath) as! TimelineCell
        cell.deploy()
        cell.update(date: data[indexPath.row][0].value)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    // MARK: - UIScrollDelegate
    
    private var scrollViewOffset: CGFloat = 0
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollViewOffset = scrollView.contentOffset.y
        if !decelerate {
            scrollViewDidScroll(scrollView)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDraggingEnd(scrollView)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDraggingEnd(_ scrollView: UIScrollView) {
        print("\(#file) \(#function): \(scrollViewOffset)")
        if scrollViewOffset < -50 {
            timeline.controller.pushEditController()
        }
    }
}


