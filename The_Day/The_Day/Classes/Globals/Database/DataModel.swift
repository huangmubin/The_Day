//
//  DataModel.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

// MARK: - Data Type

enum DataType: Int {
    case date = 0
    case anniversary = 1
    case note = 2
    case voice = 3
    case image = 4
    case video = 5
}

// MARK: - Data Model

class DataModel {
    
    // MARK: Original Value
    
    var _date: Double = 0 {
        didSet { date = Date(timeIntervalSince1970: _date) }
    }
    var _type: Int = 0 {
        didSet { type = DataType(rawValue: _type) ?? .date }
    }
    var _value: String = ""
    
    // MARK: Middle Value
    
    var date: Date = Date()
    var type: DataType = DataType.date
    
    // MARK: Date
    
    static var dayFormat: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "dd"
        return format
    }()
    
    static var monthFormat: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM"
        return format
    }()
    
    // MARK: Value
    
    var day: String {
        return DataModel.dayFormat.string(from: date)
    }
    var month: String {
        return DataModel.monthFormat.string(from: date)
    }
    var value: String {
        set { _value = newValue }
        get { return _value }
    }
    
}
