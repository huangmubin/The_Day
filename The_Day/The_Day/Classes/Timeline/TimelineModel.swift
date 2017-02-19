//
//  TimelineModel.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class TimelineModel {
    
    // MARK: - Values
    
    var datas: [[DataModel]] = []
    var count: Int { return datas.count }
    
    // MARK: - 
    
    subscript(index: Int) -> [DataModel] {
        return datas[index]
    }
    
    subscript(index: IndexPath) -> DataModel {
        return datas[index.section][index.row]
    }
    
    // MARK: - Analysis
    
    func analysis() {
        for i in 0 ..< 10 {
            let data = DataModel()
            data._date = Date().timeIntervalSince1970
            data._type = 1
            data._value = "i = \(i)"
            datas.append([data])
        }
    }
    
}
