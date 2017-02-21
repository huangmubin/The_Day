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
        let days = Tools.randomInRange(range: 0 ..< 50)
        let start = Date().timeIntervalSince1970
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        for d in 0 ..< days {
            let events = Tools.randomInRange(range: 1 ..< 6)
            
            let data = DataModel()
            data._date = start + Double(d) * 86400
            data._type = 0
            data._value = format.string(from: Date(timeIntervalSince1970: data._date))
            var arr = [data]
            for j in 0 ..< events {
                let m = DataModel()
                m._date = data._date
                m._type = 2
                m._value = "\(j) - days"
                arr.append(m)
            }
            datas.append(arr)
        }
    }
    
    
//    enum DataType: Int {
//        case date = 0
//        case anniversary = 1
//        case note = 2
//        case voice = 3
//        case image = 4
//        case video = 5
//    }
}
