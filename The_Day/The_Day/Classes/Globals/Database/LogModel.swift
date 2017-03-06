//
//  LogModel.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/23.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

// MARK: - Data Type

enum LogType: Int {
    case anniversary = 0
    case note = 1
    case voice = 2
    case image = 3
    case video = 4
}

// MARK: - Log Model

class LogModel {
    
    // MARK: Original Value
    
    var _date: Double = 0 {
        didSet {
            let format = DateFormatter()
            format.dateFormat = "HH:mm"
            time = format.string(from: Date(timeIntervalSince1970: _date))
        }
    }
    var _type: Int = 0 {
        didSet { type = LogType(rawValue: _type) ?? .anniversary }
    }
    var _value: String = ""
    
    // MARK: Values
    
    var type: LogType = LogType.anniversary
    
    var value: String {
        switch type {
        case .anniversary, .note:
            return _value
        default:
            return _value
        }
    }
    
    // MARK: Time
    
    var time = ""
    
    // MARK: Height
    
    var height: CGFloat = 0
    
    func deployHeight() {
        
    }
    
}
