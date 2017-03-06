//
//  EditCell.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/20.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class EditCell: UITableViewCell {

    
    // MARK: - Deploy
    
    private var _deploy: Bool = true
    func deploy(_ data: LogModel) {
        if _deploy {
            _deploy = false
            self.selectionStyle = UITableViewCellSelectionStyle.none
            
            loadView()
        }
        
        update(time: data.time)
        
        let _ = aniversary.update(logs: nil)
        let _ = note.update(logs: nil)
        
        switch data.type {
        case .anniversary:
            let _ = aniversary.update(logs: [data.value])
        case .note:
            let _ = note.update(logs: [data.value])
        default:
            break
        }
    }
    
    private func loadView() {
        
        // MARK: Time
        addSubview(timeLabel)
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.frame = CGRect(x: 0, y: 8, width: 50, height: 20)
        
        // MARK: Line
        lineLayer.cornerRadius = 2
        lineLayer.backgroundColor = UIColor(239,239,239).cgColor
        lineLayer.frame = CGRect(x: 50, y: 8, width: 4, height: 60)
        contentView.layer.addSublayer(lineLayer)
        
        addSubview(aniversary)
        addSubview(note)
    }
    
    // MARK: - Label
    
    let timeLabel = UILabel()
    
    func update(time: String?) {
        timeLabel.text = time
    }
    
    // MARK: - Line
    
    let lineLayer = CALayer()
    
    func update(line: CGFloat) {
        lineLayer.frame = lineLayer.frame.update(h: line)
    }
    
    // MARK: - Anniversary
    
    let aniversary = EditCellAnniversaryView()
    
    // MARK: - Note
    
    let note = EditCellNoteView()
    
}
