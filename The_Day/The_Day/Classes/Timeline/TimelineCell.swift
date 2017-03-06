//
//  TimelineCell.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {

    // MARK: - Deploy
    
    private var _deploy: Bool = true
    func deploy(_ data: DayModel) {
        if _deploy {
            _deploy = false
            self.selectionStyle = UITableViewCellSelectionStyle.none
            
            loadView()
        }
        
        update(line: data.height - 8)
        dateView.update(year: data.year, month: data.month, day: data.day)
        update(week: data.week, age: data.age)
        
        var addView = false
        var y: CGFloat = 36
        addView = anniversaryView.update(logs: data.anniversary())
        if addView {
            y = anniversaryView.frame.maxY + 8
        }
        addView = noteView.update(y: y, logs: data.note())
    }
    
    private func loadView() {
        // MARK: Date View
        addSubview(dateView)
        
        // MARK: Line
        lineLayer.cornerRadius = 2
        lineLayer.backgroundColor = UIColor(239,239,239).cgColor
        lineLayer.frame = bounds.transform(x: 60, y: 5).update(w: 4, h: bounds.height - 8)
        contentView.layer.addSublayer(lineLayer)
        
        // MARK: Day
        week.textColor = UIColor.lightGray
        age.textColor = UIColor.lightGray
        addSubview(week)
        addSubview(age)
        
        // MARK: Anniversary View
        addSubview(anniversaryView)
        
        // MARK: Note View
        addSubview(noteView)
    }
    
    
    // MARK: - DateView
    
    let dateView = TimelineCellDateView()
    
    // MARK: - Line
    
    let lineLayer = CALayer()
    
    func update(line: CGFloat) {
        lineLayer.frame = lineLayer.frame.update(h: line)
    }
    
    
    // MARK: - Day Label
    
    let week = UILabel()
    let age = UILabel()
    
    func update(week: String?, age: String?) {
        self.week.text = week
        self.age.text = age
        self.week.sizeToFit()
        self.age.sizeToFit()
        self.week.frame = self.week.frame.update(
            x: CGRect.screen.width - 8 - self.week.frame.width,
            y: 8
        )
        self.age.frame = self.age.frame.update(
            x: 68, y: 8
        )
    }
    
    // MARK: - Anniversary View
    
    let anniversaryView = TimelineCellAnniversaryView()
    
    // MARK: - Note View
    
    let noteView = TimelineCellNoteView()
}
