//
//  TimelineTableView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/3/8.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    weak var timeline: TimelineView!
    
    // MARK: - Init
    
    init() {
        super.init(frame: UIScreen.main.bounds, style: .plain)
        deploy()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        deploy()
    }
    
    private func deploy() {
        self.frame = CGRect.screen.transform(y: 64)
        self.register(TimelineCell.self, forCellReuseIdentifier: "Cell")
        self.dataSource = self
        self.delegate = self
    }
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TimelineCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AppData.days[indexPath.row].height
    }

}
