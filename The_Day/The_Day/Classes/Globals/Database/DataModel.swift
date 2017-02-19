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
    
    var _date: Double = 0
    var _tag: Int = 0
    var _value: String = ""
    var _type: Int = 0
    
    // MARK: Date
    
    var value: String {
        set { _value = newValue }
        get { return _value }
    }
    
}
