//
//  TimelineHeaderView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/3/8.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineHeaderView: UIView {

    weak var timeline: TimelineView!
    
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
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
        
        // Background
        self.frame = CGRect.screen.update(h: 70)
        self.layer.addSublayer(shodowLayer)
        shodowLayer.frame = CGRect(x: 0, y: 60, width: bounds.width, height: 4)
        shodowLayer.backgroundColor = UIColor.white.cgColor
        shodowLayer.shadowOpacity = 1
        shodowLayer.shadowRadius = 0.5
        shodowLayer.shadowColor = UIColor(178,178,178).cgColor
        shodowLayer.shadowOffset = CGSize(width: 0, height: 1)
        
        // Date
        let x = bounds.width / 4
        
        addSubview(day)
        day.addTarget(self, action: #selector(dayAction), for: .touchUpInside)
        day.setTitleColor(UIColor.black, for: .normal)
        day.frame = CGRect(x: x, y: 20, width: x * 2, height: 44)
        day.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightMedium)
        
        addSubview(year)
        year.addTarget(self, action: #selector(yearAction), for: .touchUpInside)
        year.setTitleColor(UIColor.black, for: .normal)
        year.contentHorizontalAlignment = .right
        year.frame = CGRect(x: x * 3, y: 20, width: x - 8, height: 44)
        year.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)
        
        // Up
        /*
        addSubview(up)
        up.frame = CGRect(x: 0, y: 230, width: bounds.width, height: 30)
        up.tintColor = UIColor.black
        up.setImage(UIImage(named: "Sure"), for: .normal)
        up.setTitleColor(UIColor.black, for: .normal)
        up.addTarget(self, action: #selector(upAction), for: .touchUpInside)
         */
    }
    
    // MARK: - Frame
    
    override var bounds: CGRect {
        didSet {
            updateFrame()
        }
    }
    
    override var frame: CGRect {
        didSet {
            updateFrame()
        }
    }
    
    func updateFrame() {
        shodowLayer.frame.origin.y = bounds.height - 10
        
    }
    
    // MARK: - Layer
    
    let shodowLayer = CALayer()
    
    
    // MARK: - Day
    
    let day = UIButton(type: UIButtonType.system)
    
    func deploy(day: String?) {
        self.day.setTitle(day, for: .normal)
    }
    
    func dayAction() {
        
    }
    
    // MARK: - Year
    
    let year = UIButton(type: UIButtonType.system)
    
    func deploy(year: String?) {
        self.year.setTitle(year, for: .normal)
    }
    
    func yearAction() {
        
    }
    
    // MARK: - Up Button
    
    let up = UIButton(type: UIButtonType.system)
    
    func upAction() {
        
    }
    
}
