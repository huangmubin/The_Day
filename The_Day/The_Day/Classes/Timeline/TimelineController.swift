//
//  TimelineController.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/3/7.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineController: UIViewController {
    
    // MARK: - Life
    
    override func loadView() {
        super.loadView()
        timeline.controller = self
        view = timeline
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppData.loadData()
        AppData.loadToday()
        
        timeline.header.deploy(day: "\(AppData.editDay.week) \(AppData.editDay.day)th")
        timeline.header.deploy(year: "\(AppData.editDay.month). \(AppData.editDay.year)")
    }
    
    // MARK: - View
    
    let timeline = TimelineView()
    
    
}
