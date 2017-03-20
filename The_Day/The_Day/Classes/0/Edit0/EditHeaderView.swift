//
//  EditHeaderView.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/24.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class EditHeaderView: UIImageView {
    
    weak var editView: EditView!
    
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
        isUserInteractionEnabled = true
        
        // MARK: BackgroundImage
        imageView.image = UIImage(named: "Header_Background")
        imageView.frame = CGRect.screen.update(h: 70)
        addSubview(imageView)
        
        // MARK: Labels
        let view = UIView()
        view.frame = CGRect.screen.update(h: 60)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        addSubview(view)
        dayLabel.font = UIFont.boldSystemFont(ofSize: 22)
        dayLabel.textColor = UIColor.white
        view.addSubview(dayLabel)
        
        // MARK: Button
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        backButton.setImage(UIImage(named: "Edit_Header_Done"), for: .normal)
        backButton.frame = CGRect(x: 8, y: 20, width: 40, height: 40)
        addSubview(backButton)
    }
    
    // MARK: - BackImage
    
    let imageView = UIImageView()
    
    // MARK: - Date Label
    
    let dayLabel = UILabel()
    
    func update(day: String?) {
        dayLabel.text = day
        dayLabel.sizeToFit()
        
        dayLabel.center = CGPoint(x: CGRect.screen.midX, y: 40)
    }
    
    // MARK: - Back Button
    
    let backButton = UIButton()
    
    func backAction() {
        mylog("backAction")
        editView.controller.dismiss(animated: true, completion: nil)
    }
    
}
