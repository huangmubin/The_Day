//
//  CellView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/3/8.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class CellView: UIView {
    
    var _deploy = true
    func deploy(data: LogModel) {
        if _deploy {
            _deploy = false
            
            self.layer.backgroundColor = UIColor.white.cgColor
            self.layer.cornerRadius = 4
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 1
            self.layer.shadowOffset = CGSize.zero
            self.layer.shadowColor = UIColor(178,178,178).cgColor
            
            addSubview(anniversary)
            for t in [tagr, tagl] {
                t.layer.cornerRadius = 8
                t.layer.backgroundColor = UIColor(178,178,178).cgColor
                t.layer.shadowOffset = CGSize.zero
                t.layer.shadowOpacity = 1
                t.layer.shadowRadius = 2
                t.layer.shadowColor = t.layer.backgroundColor
                t.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
                addSubview(t)
            }
            
            addSubview(note)
            
            resize()
        }
        
        switch data.type {
        case .anniversary:
            anniversary.isHidden = false
            tagl.isHidden = false
            tagr.isHidden = false
            note.isHidden = true
            
            anniversary.text = data.value
        case .note:
            anniversary.isHidden = true
            tagl.isHidden = true
            tagr.isHidden = true
            note.isHidden = false
            
            note.text = data.value
        default:
            break
        }
    }
    
    // MARK: - Frame
    
    override var frame: CGRect { didSet { resize() } }
    override var bounds: CGRect { didSet { resize() } }
    
    func resize() {
        let w = bounds.width
        let h = bounds.height
        
        anniversary.frame = CGRect(x: 32, y: 8, width: w - 64, height: h - 16)
        tagl.frame = CGRect(x: 8, y: h / 2 - 8, width: 16, height: 16)
        tagr.frame = CGRect(x: w - 24, y: h / 2 - 8, width: 16, height: 16)
        
        note.frame = CGRect(x: 8, y: 8, width: w - 16, height: h - 16)
    }
    
    // MARK: - Anniversary
    
    let anniversary: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.isHidden = true
        return label
    }()
    
    let tagl = UIView()
    let tagr = UIView()
    
    // MARK: - Note
    
    let note: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.isHidden = true
        return label
    }()
    
}
