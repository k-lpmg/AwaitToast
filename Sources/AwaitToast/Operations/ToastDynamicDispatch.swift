//
//  ToastDynamicDispatch.swift
//  AwaitToast
//
//  Created by DongHeeKang on 02/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

final class ToastDynamicDispatch {
    
    weak var view: UIView?
    unowned let operation: Operation
    unowned let frameChangeable: FrameChangeable
    
    init(view: UIView? = nil, operation: Operation, frameChangeable: FrameChangeable) {
        self.view = view
        self.operation = operation
        self.frameChangeable = frameChangeable
        setSelector()
    }
    
    // MARK: - Private methods
    
    private func setSelector() {
        NotificationCenter.default.addObserver(self, selector: #selector(deviceOrientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
        view?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
    }
    
    // MARK: - Private selector
    
    @objc func deviceOrientationDidChange() {
        guard let window = UIApplication.shared.keyWindow else {return}
        frameChangeable.updateFrame(window: window)
    }
    
    @objc func viewTapped() {
        operation.cancel()
    }
    
}
