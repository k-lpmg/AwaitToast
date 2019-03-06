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
        
        _dynamicDispatch = .init(view: behavior.isTappedDismissEnabled ? view : nil, operation: self, frameChangeable: self)
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
    
}

// MARK: - FrameChangeable

extension ToastOperation: FrameChangeable {
    
    func updateFrame(window: UIWindow) {
        view.frame = getFrametoBeUpated(from: window)
    }
    
    private func getFrametoBeUpated(from window: UIWindow) -> CGRect {
        let appearanceHeight = view.appearance.height
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let originY: CGFloat
        let height: CGFloat
        switch view.direction {
        case .top:
            originY = 0
            height = appearanceHeight + statusBarSize.height
        case .bottom:
            if #available(iOS 11.0, *) {
                height = appearanceHeight + window.safeAreaInsets.bottom
            } else {
                height = appearanceHeight
            }
            originY = window.bounds.height - height
        }
        return CGRect(x: 0, y: originY, width: window.bounds.width, height: height)
    }
    
}
