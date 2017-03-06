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
        backgroundColor = UIColor.white
        
        dataSource = self
        delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineCell", for: indexPath) as! TimelineCell
        cell.deploy(AppData[indexPath])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AppData[indexPath].height
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.editDay = AppData[indexPath]
        timeline.controller.pushEditController()
    }
    
    
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
//        print("\(#file) \(#function): \(scrollViewOffset)")
//        if scrollViewOffset < -50 {
//            timeline.controller.pushEditController()
//        }
    }
}


