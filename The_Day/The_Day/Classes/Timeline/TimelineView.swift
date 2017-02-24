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
        // MARK: Background
        backgroundColor = UIColor.white
        layer.cornerRadius = 8
        
        // MARK: TableView
        tableView.frame = CGRect.screen.transform(y: 80)
        addSubview(tableView)
        
        // MARK: Header View
        header.frame = CGRect.screen.update(h: 80)
        addSubview(header)
        
        // MARK: Add Button
        addButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        addButton.setImage(UIImage(named: "Timeline_Add"), for: .normal)
        addButton.frame = CGRect(
            x: CGRect.screen.midX - 45,
            y: CGRect.screen.maxY - 98,
            width: 90,
            height: 90
        )
        addSubview(addButton)
    }
    
    // MARK: - Header View
    
    let header = TimelineHeaderView()
    
    // MARK: - TableView
    
    let tableView = TimelineTableView(frame: UIScreen.main.bounds)
    
    // MARK: - Add Button
    
    var addButton: UIButton = UIButton()
    
    func addAction() {
        AppData.loadToday()
        controller.pushEditController()
    }
    
}



