//
//  DayModel.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/22.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

class DayModel {
    
    // MARK: - Datas
    
    var date: Double = 0 {
        didSet {
            reload(date: date)
        }
    }
    var logs: [LogModel] = []
    
    // MARK: - Date
    
    var year: String  = ""
    var month: String = ""
    var day: String   = ""
    var week: String  = ""
    var age: String = ""
    
    func reload(date: Double) {
        let calender = MCalendar(date: date)
        year = calender.sYear
        month = calender.sMonth
        day = calender.sDay
        week = calender.sWeek
        age = calender.sAge
    }
    
    // MARK: - Logs
    
    // MARK: Log Index
    
    private var anniversaryIndex = [Int]()
    private var noteIndex = [Int]()
    private var voiceIndex = [Int]()
    private var imageIndex = [Int]()
    private var videoIndex = [Int]()
    
    func deployIndex() {
        logs.sort(by: { $0._date < $1._date })
        for (i, log) in logs.enumerated() {
            switch log.type {
            case .anniversary:
                anniversaryIndex.append(i)
            case .note:
                noteIndex.append(i)
            case .voice:
                voiceIndex.append(i)
            case .image:
                imageIndex.append(i)
            case .video:
                videoIndex.append(i)
            }
        }
        
        deployHeight()
    }
    
    func anniversary() -> [String]? {
        if anniversaryIndex.count > 0 {
            var values = [String]()
            for i in anniversaryIndex {
                values.append(logs[i].value)
            }
            return values
        }
        return nil
    }
    
    func note() -> [String]? {
        if noteIndex.count > 0 {
            var values = [String]()
            for i in noteIndex {
                values.append(logs[i].value)
            }
            return values
        }
        return nil
    }
    
    // MARK: - Height
    
    var height: CGFloat = 36
    
    func deployHeight() {
        height = 36
        var value = ""
        
        if let logValues = anniversary() {
            value = ""
            for log in logValues {
                value += "\(log)\n"
            }
            value.remove(at: value.index(before: value.endIndex))
            
            height = height + 8 + 16 + Tools.textHeight(value, width: CGRect.screen.width - 80, font: UIFont.boldSystemFont(ofSize: 17))
        }
        
        if let logValues = note() {
            value = ""
            for log in logValues {
                value += "\(log)\n"
            }
            value.remove(at: value.index(before: value.endIndex))
            
            height = height + 8 + 16 + Tools.textHeight(value, width: CGRect.screen.width - 80, font: UIFont.boldSystemFont(ofSize: 17))
        }
    }
    
}
