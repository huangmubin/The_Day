//
//  Tools.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/19.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//

import UIKit

public func mylog(_ note: String, path: String = #file, function: String = #function) {
    var file = path
    if let range = file.range(of: "/Classes/") {
        file.removeSubrange(file.startIndex ..< range.upperBound)
    }
    print("\(file) -> \(function): \(note)")
}

public class Tools {
    
    // MARK: - 获取随机数
    
    public class func randomInRange(range: Range<Int>) -> Int {
        return  Int(arc4random_uniform(UInt32(range.count))) + range.lowerBound
    }
    
    // MARK: - 文本高度
    
    public class func textHeight(_ text: String, width: CGFloat, font: UIFont = UIFont.boldSystemFont(ofSize: 17)) -> CGFloat {
        let text = NSString(string: text)
        let constraint = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let box = text.boundingRect(with: constraint, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil).size.height
        switch Int(box * 1000) % 1000 {
        case 0:
            return CGFloat(Int(box))
        case 0 ..< 501:
            return CGFloat(Int(box)) + 0.5
        default:
            return CGFloat(Int(box)) + 1
        }
    }
    
}

/*

// MARK: - 日期获取

public class func day(time: TimeInterval) -> String? {
    let now = Double(Int(Date().timeIntervalSince1970 / 86400) * 86400)
    switch time {
    case now - 172800 ..< now - 86400:
        return "前天"
    case now - 86400 ..< now:
        return "昨天"
    case now ..< now + 86400:
        return "今天"
    case now + 86400 ..< now + 172800:
        return "明天"
    case now + 172800 ..< now + 259200:
        return "后天"
    default:
        return nil
    }
}

public class func minute(time: TimeInterval) -> String {
    var str = ""
    let min = Int(time) / 60
    if min >= 10 {
        str += "\(min)"
    } else {
        str += "0\(min)"
    }
    
    let sec = Int(time) % 60
    if sec >= 10 {
        str += ":\(sec)"
    } else {
        str += ":0\(sec)"
    }
    return str
}

// MARK: - Location

public class func localized(_ key: String) -> String {
    return NSLocalizedString(key, comment: key)
}

public class func localized(_ result: Bool, _ key1: String, _ key2: String) -> String {
    if result {
        return NSLocalizedString(key1, comment: key1)
    } else {
        return NSLocalizedString(key2, comment: key2)
    }
}
    */
