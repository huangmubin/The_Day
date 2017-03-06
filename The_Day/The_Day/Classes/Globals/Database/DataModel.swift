//
//  DataModel.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

// MARK: - Data

var AppData: DataModel = {
    let data = DataModel()
    data.loadData()
    return data
}()

// MARK: - Data Model

class DataModel {
    
    // MARK: Data
    
    var days = [DayModel]()
    var editDay: DayModel!
    
}

// MARK: - Get

extension DataModel {
    
    var count: Int { return days.count }
    subscript(_ index: IndexPath) -> DayModel {
        return days[index.row]
    }
}

// MARK: - Load Data

extension DataModel {
    
    func loadData() {
        let originDay = Date().timeIntervalSince1970
        
        for iDay in 0 ..< Tools.randomInRange(range: 0 ..< 100) {
            let day = DayModel()
            day.date = originDay + Double(iDay * 86400)
            days.append(day)
            
            for iLog in 0 ..< Tools.randomInRange(range: 1 ..< 10) {
                let log = LogModel()
                log._date = day.date
                log._type = Tools.randomInRange(range: 0 ..< 2)
                log._value = "xxxxx \(iDay) \(iLog)"
                day.logs.append(log)
            }
            
            day.deployIndex()
        }
    }
    
    func loadToday() {
        let range = MCalendar.range(Date().timeIntervalSince1970)
        for day in days {
            switch day.date {
            case range.0 ..< range.1:
                editDay = day
                return
            default:
                break
            }
        }
        editDay = DayModel()
        editDay.date = range.0
    }
    
}


