//
//  EditView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/20.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class EditView: UIImageView {
    
    weak var controller: EditController!
    
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
        isUserInteractionEnabled = true
        
        // MARK: TableView
        tableView.editView = self
        tableView.frame = CGRect.screen.transform(y: 60)
        addSubview(tableView)
        
        // MARK: Header View
        header.editView = self
        header.frame = CGRect.screen.update(h: 60)
        addSubview(header)
    }
    
    // MARK: - Header View
    
    let header = EditHeaderView()
    
    // MARK: - TableView
    
    let tableView = EditTableView(frame: UIScreen.main.bounds)
    
    
}
