//
//  TimelineCellDateView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/22.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineCellDateView: UIImageView {

    
    // MARK: - Init
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
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
        image = UIImage(named: "TableView_Cell_Calendar")
        
        addSubview(day)
        addSubview(year)
        addSubview(month)
        
        month.textColor = UIColor.white
        year.textColor = UIColor(255,150,163)
        day.textColor = UIColor(255,150,163)
        
        month.font = UIFont.boldSystemFont(ofSize: 12)
        day.font = UIFont.boldSystemFont(ofSize: 24)
        year.font = UIFont.boldSystemFont(ofSize: 8)
    }
    
    // MARK: Labels
    
    let day = UILabel()
    let year = UILabel()
    let month = UILabel()
    
    func update(year: String?, month: String?, day: String?) {
        self.year.text = year
        self.month.text = month
        self.day.text = day
        
        self.year.sizeToFit()
        self.month.sizeToFit()
        self.day.sizeToFit()
        
        self.year.frame = self.year.frame.update(
            x: 60 - 11 - self.year.frame.width,
            y: 60 - 8 - self.year.frame.height
        )
        self.day.center = CGPoint(x: 30, y: 32)
        self.month.center = CGPoint(x: 30, y: 13)
    }
    
    
    
}
