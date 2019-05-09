//
//  ToastOperation.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import Foundation

fileprivate let kIsFinished = "isFinished"

class ToastOperation<A, B>: Operation where A: ToastAppearance, B: ToastBehavior {
    
    // MARK: - Properties
    
    var view: ToastView<A>
    let behavior: B = B.shared
    
    private var _dynamicDispatch: ToastDynamicDispatch!
    
    // MARK: - Con(De)structor
    
    init(view: ToastView<A>) {
        self.view = view
        super.init()
        
        _dynamicDispatch = .init(view: behavior.isTappedDismissEnabled ? view : nil, operation: self)
    }
    
    // MARK: - Overridden: Operation
    
    private var _finished = false
    override var isFinished: Bool {
        get {
            return _finished
        }
        set {
            willChangeValue(forKey: kIsFinished)
            _finished = newValue
            didChangeValue(forKey: kIsFinished)
        }
    }
    
    override func main() {
        toastAbstractMethod()
    }
    
    // MARK: - Internal methods
    
    func dismiss(completion: ((Bool) -> Void)? = nil) {
        self.isFinished = true
        
        let toOriginX = view.frame.origin.x
        let toOriginY: CGFloat
        switch view.direction {
        case .top:
            toOriginY = -view.bounds.height
        case .bottom:
            toOriginY = view.frame.origin.y + view.bounds.height
        }
        
        UIView.animate(withDuration: behavior.dismissDuration,
                       animations: {
                        self.view.frame.origin = CGPoint(x: toOriginX, y: toOriginY)
        },
                       completion: { (_) in
                        self.view.removeFromSuperview()
        })
    }
    
    func showToast() {
        guard let window = UIApplication.shared.keyWindow else {return}
        
        window.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        if view.appearance.height == AutomaticDimension {
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        } else {
            let safeAreaPadding: CGFloat
            switch view.direction {
            case .top:
                safeAreaPadding = UIApplication.shared.statusBarFrame.size.height
            case .bottom:
                if #available(iOS 11.0, *), let window = UIApplication.shared.keyWindow {
                    safeAreaPadding = window.safeAreaInsets.bottom
                } else {
                    safeAreaPadding = 0
                }
            }
            view.heightAnchor.constraint(equalToConstant: view.appearance.height + safeAreaPadding).isActive = true
        }
        
        let initialViewYAnchor: NSLayoutConstraint
        let toViewYAnchor: NSLayoutConstraint
        switch self.view.direction {
        case .top:
            initialViewYAnchor = self.view.bottomAnchor.constraint(equalTo: window.topAnchor)
            toViewYAnchor = self.view.topAnchor.constraint(equalTo: window.topAnchor)
        case .bottom:
            initialViewYAnchor = self.view.topAnchor.constraint(equalTo: window.bottomAnchor)
            toViewYAnchor = self.view.bottomAnchor.constraint(equalTo: window.bottomAnchor)
        }
        initialViewYAnchor.isActive = true
        window.layoutIfNeeded()
        
        UIView.animate(withDuration: behavior.showDurarion) {
            initialViewYAnchor.isActive = false
            toViewYAnchor.isActive = true
            window.layoutIfNeeded()
        }
    }
    
}
