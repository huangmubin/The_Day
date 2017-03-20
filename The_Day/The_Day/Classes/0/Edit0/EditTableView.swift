//
//  EditTableView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/24.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class EditTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    weak var editView: EditView!
    
    // MARK: - TableView
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        deploy()
    }
    
    override init(frame: CGRect, style: UITableViewStyle = UITableViewStyle.plain) {
        super.init(frame: frame, style: style)
        deploy()
    }
    
    private func deploy() {
        isUserInteractionEnabled = true
        register(EditCell.self, forCellReuseIdentifier: "EditCell")
        separatorStyle = .none
        backgroundColor = UIColor.white
        
        dataSource = self
        delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.editDay.logs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditCell", for: indexPath) as! EditCell
        cell.deploy(AppData.editDay[indexPath])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
