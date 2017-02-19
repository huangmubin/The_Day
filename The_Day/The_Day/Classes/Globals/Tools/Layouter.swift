//
//  Layouter.swift
//  The_Day
//
//  Created by 黄穆斌 on 2017/2/18.
//  Copyright © 2017年 黄穆斌. All rights reserved.
//


import UIKit

// MARK: - Layouter Class

/**
 自动布局类。
 Layouer: 主类。每次设置布局时创建
 Container: 副类。用于布局时存储 NSLayoutConstraint
 */
class Layouter {
    
    weak var superview: UIView!
    weak var view: UIView!
    weak var relative: UIView!
    
    // MARK: Init
    
    init(superview: UIView, view: UIView, relative: UIView? = nil, container: Layouter.Container? = nil) {
        self.superview = superview
        self.view = view
        self.relative = relative ?? superview
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self._contrainer = container
    }
    
    func setViews(view: UIView? = nil, relative: UIView? = nil) -> Layouter {
        if let view = view {
            self.view = view
            self.view.translatesAutoresizingMaskIntoConstraints = false
        }
        if let view = relative {
            self.relative = view
        }
        return self
    }
    
    // MARK: Constraints
    
    /* 每次添加 Layout 之后，都会把生成的 NSLayoutConstraint 存储到 _constrants。除非 Layouter 被释放或主动调用 clearConstrants，否则不会被释放。 */
    fileprivate var _constrants: [NSLayoutConstraint] = []
    
    @discardableResult
    func clearConstrants() -> Layouter {
        _constrants.removeAll(keepingCapacity: true)
        return self
    }
    
    @discardableResult
    func constrants(block: ([NSLayoutConstraint]) -> Void) -> Layouter {
        block(_constrants)
        return self
    }
    
    @discardableResult
    func constrants(index: Int) -> NSLayoutConstraint {
        return _constrants[index]
    }
    
    @discardableResult
    func constrants(last: (NSLayoutConstraint) -> Void) -> Layouter {
        last(_constrants.last!)
        return self
    }
    
    // MARK: Contrainer
    
    /* 在设置 Layout 的中间进行 Container 添加操作。 */
    
    weak var _contrainer: Layouter.Container?
    
    @discardableResult
    func setContrainer(_ con: Layouter.Container) -> Layouter {
        _contrainer = con
        return self
    }
    
    @discardableResult
    func contrainer(index: Int, key: String, orient: Layouter.Orientation = .unkown) -> Layouter {
        _contrainer?.append(key: key, layout: _constrants[index], orient: orient)
        return self
    }
    
    @discardableResult
    func contrainer(key: String, orient: Layouter.Orientation = .unkown, active: Bool = false) -> Layouter {
        _constrants.last!.isActive = active
        _contrainer?.append(key: key, layout: _constrants.last!, orient: orient)
        return self
    }
    
    @discardableResult
    func contrainer(_ block: (Int, NSLayoutConstraint) -> String?) -> Layouter {
        for (index, layout) in _constrants.enumerated() {
            if let key = block(index, layout) {
                _contrainer?.append(key: key, layout: layout)
            }
        }
        return self
    }
    
}

// MARK: - Layout Container

extension Layouter {
    
    /**
     NSLayoutConstraint Container
     */
    class Container {
        
        var layouts: [AnyHashable : LayoutInfo]
        
        init() {
            layouts = [AnyHashable : LayoutInfo]()
            NotificationCenter.default.addObserver(self, selector: #selector(notify), name: .UIDeviceOrientationDidChange, object: nil)
        }
        deinit {
            NotificationCenter.default.removeObserver(self, name: .UIDeviceOrientationDidChange, object: nil)
        }
        
        subscript(key: AnyHashable) -> NSLayoutConstraint? {
            return layouts[key]?.layout
        }
        
        func remove(key: AnyHashable) {
            layouts.removeValue(forKey: key)
        }
        
        func clear() {
            layouts.removeAll()
        }
        
        func append(key: AnyHashable, layout: NSLayoutConstraint, orient: Layouter.Orientation = .unkown) {
            layouts[key] = LayoutInfo(layout: layout, orient: orient)
        }
        
        @objc func notify(object: Notification) {
            updateActive()
        }
        
        func updateActive() {
            OperationQueue.main.addOperation {
                for (_, layout) in self.layouts {
                    layout.layout.isActive = false
                }
                for (_, layout) in self.layouts {
                    layout.match()
                }
            }
        }
    }
    
}

extension Layouter.Container {
    
    class LayoutInfo {
        
        var layout: NSLayoutConstraint
        var orient: Layouter.Orientation
        
        init(layout: NSLayoutConstraint, orient: Layouter.Orientation = .unkown) {
            self.layout = layout
            self.orient = orient
        }
        
        func match() {
            switch orient {
            case .unkown:
                break
            case .all:
                layout.isActive = true
            case .portrait:
                layout.isActive = UIScreen.main.bounds.width < UIScreen.main.bounds.height
            case .landscape:
                layout.isActive = UIScreen.main.bounds.width > UIScreen.main.bounds.height
            case .portraitUpside:
                layout.isActive = UIDevice.current.orientation == UIDeviceOrientation.portrait
            case .portraitUpsideDown:
                layout.isActive = UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown
            case .landscapeRight:
                layout.isActive = UIDevice.current.orientation == UIDeviceOrientation.landscapeRight
            case .landscapeLeft:
                layout.isActive = UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft
            }
        }
        
    }
    
}

extension Layouter {
    
    enum Orientation: Int {
        case portraitUpside     = 1
        case portraitUpsideDown = 2
        case landscapeLeft  = 4
        case landscapeRight = 8
        
        case portrait  = 3
        case landscape = 12
        
        case all = 15
        
        case unkown = 0
    }
    
}

// MARK: - Customs Layout

extension Layouter {
    
    @discardableResult
    func layout(edge: NSLayoutAttribute, to: NSLayoutAttribute, constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: edge, relatedBy: related, toItem: relative, attribute: to, multiplier: multiplier, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    
    
}

// MARK: - Predefined Layout: Size

extension Layouter {
    
    // Height To relative
    @discardableResult
    func height(_ constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: .height, relatedBy: related, toItem: relative, attribute: .height, multiplier: multiplier, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    // Height To Self
    @discardableResult
    func heightSelf(_ constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: .height, relatedBy: related, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    // Width To relative
    @discardableResult
    func width(_ constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: .width, relatedBy: related, toItem: relative, attribute: .width, multiplier: multiplier, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    @discardableResult
    func widthSelf(_ constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: .width, relatedBy: related, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    /// Type true is width to height, false is height to width
    @discardableResult
    func aspect(type: Bool = true, constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: type ? .width : .height, relatedBy: related, toItem: view, attribute: type ? .height : .width, multiplier: multiplier, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    /// width and height
    @discardableResult
    func size(w: CGFloat, h: CGFloat, priority: Float = 1000) -> Layouter {
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: w)
            lay.priority = priority
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: h)
            lay.priority = priority
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        return self
    }
    
    /// width and height to relative
    @discardableResult
    func size(priority: Float = 1000) -> Layouter {
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: relative, attribute: .width, multiplier: 1, constant: 0)
            lay.priority = priority
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: relative, attribute: .height, multiplier: 1, constant: 0)
            lay.priority = priority
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        return self
    }
    
}

// MARK: - Predefined Layout: Single Layout

extension Layouter {
    
    @discardableResult
    func top(_ constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: .top, relatedBy: related, toItem: relative, attribute: .top, multiplier: multiplier, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    @discardableResult
    func bottom(_ constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: related, toItem: relative, attribute: .bottom, multiplier: multiplier, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    @discardableResult
    func leading(_ constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: related, toItem: relative, attribute: .leading, multiplier: multiplier, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    @discardableResult
    func trailing(_ constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: related, toItem: relative, attribute: .trailing, multiplier: multiplier, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    @discardableResult
    func centerX(_ constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: related, toItem: relative, attribute: .centerX, multiplier: multiplier, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
    @discardableResult
    func centerY(_ constant: CGFloat = 0, multiplier: CGFloat = 1, priority: Float = 1000, related: NSLayoutRelation = .equal) -> Layouter {
        let lay = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: related, toItem: relative, attribute: .centerY, multiplier: multiplier, constant: constant)
        lay.priority = priority
        superview.addConstraint(lay)
        _constrants.append(lay)
        return self
    }
    
}

// MARK: - Predefined Layout: Double Layout

extension Layouter {
    
    @discardableResult
    func center(x: CGFloat = 0, y: CGFloat = 0) -> Layouter {
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: relative, attribute: .centerX, multiplier: 1, constant: x)
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: relative, attribute: .centerY, multiplier: 1, constant: y)
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        return self
    }
    
    @discardableResult
    func horizontal(leading: CGFloat = 0, trailing: CGFloat = 0) -> Layouter {
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: relative, attribute: .leading, multiplier: 1, constant: leading)
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: relative, attribute: .trailing, multiplier: 1, constant: trailing)
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        return self
    }
    
    @discardableResult
    func vertical(top: CGFloat = 0, bottom: CGFloat = 0) -> Layouter {
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: relative, attribute: .top, multiplier: 1, constant: top)
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: relative, attribute: .bottom, multiplier: 1, constant: bottom)
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        return self
    }
    
}


// MARK: - Predefined Layout: Four Layout

extension Layouter {
    
    @discardableResult
    func edges(top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0) -> Layouter {
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: relative, attribute: .top, multiplier: 1, constant: top)
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: relative, attribute: .bottom, multiplier: 1, constant: bottom)
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: relative, attribute: .leading, multiplier: 1, constant: leading)
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        let _ = {
            let lay = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: relative, attribute: .trailing, multiplier: 1, constant: trailing)
            superview.addConstraint(lay)
            _constrants.append(lay)
        }()
        return self
    }
    
}
