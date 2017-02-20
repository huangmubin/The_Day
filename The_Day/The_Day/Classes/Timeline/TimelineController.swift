//
//  TimelineController.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/17.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineController: UIViewController {
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        self.view = timeline
        timeline.controller = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.analysis()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return UIStatusBarStyle.lightContent }
    override var prefersStatusBarHidden: Bool { return true }
    
    // MARK: - View
    
    private let timeline = TimelineView()
    
    // MARK: - Data
    
    var data = TimelineModel()
    
    // MARK: - Segue
    
    func pushEditController() {
        let edit = EditController()
        self.present(edit, animated: true) { 
            
        }
    }
    
}
