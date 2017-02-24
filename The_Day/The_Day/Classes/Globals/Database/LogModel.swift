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
    
    var _date: Double = 0
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
    
}
