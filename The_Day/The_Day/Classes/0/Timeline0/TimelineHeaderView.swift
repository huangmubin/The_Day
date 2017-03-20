//
//  TimelineHeaderView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineHeaderView: UIView {

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
        // MARK: Background Color
        
        // MARK: BackgroundImage
        imageView.image = UIImage(named: "Header_Background")
        imageView.frame = CGRect.screen.update(h: 90)
        addSubview(imageView)
        
        // MARK: Labels
        let view = UIView()
        view.frame = CGRect.screen.update(h: 80)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        addSubview(view)
        dayLabel.font = UIFont.boldSystemFont(ofSize: 22)
        dayLabel.textColor = UIColor.white
        yearLabel.textColor = UIColor.white
        view.addSubview(dayLabel)
        view.addSubview(yearLabel)
    }
    
    // MARK: - BackImage
    
    let imageView = UIImageView()
    
    // MARK: - Date Label
    
    var dayLabel = UILabel()
    var yearLabel = UILabel()
    
    func update(year: String?, day: String?) {
        dayLabel.text = day
        yearLabel.text = year
        dayLabel.sizeToFit()
        yearLabel.sizeToFit()
        
        dayLabel.frame = dayLabel.frame.update(
            x: bounds.width - dayLabel.frame.width - 8,
            y: bounds.center().y - dayLabel.frame.height + 10
        )
        yearLabel.frame = yearLabel.frame.update(
            x: bounds.width - yearLabel.frame.width - 8,
            y: bounds.center().y + 10
        )
    }
    
}
