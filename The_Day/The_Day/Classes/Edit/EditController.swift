//
//  EditController.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/20.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class EditController: UIViewController {
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        self.view = editView
        editView.controller = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        editView.header.update(day: "\(AppData.editDay.day)th \(AppData.editDay.month).\(AppData.editDay.year)")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mylog("\(editView.isUserInteractionEnabled); \(editView.header.isUserInteractionEnabled); \(editView.header.backButton.isUserInteractionEnabled)")
    }
    
    deinit {
        mylog("Deinit")
    }
    
    // MARK: - Controller Set
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return UIStatusBarStyle.lightContent }
    //override var prefersStatusBarHidden: Bool { return true }
    
    // MARK: - View
    
    private let editView = EditView()
}
