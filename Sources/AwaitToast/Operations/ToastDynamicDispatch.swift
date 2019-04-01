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
    
    init(view: UIView? = nil, operation: Operation) {
        self.view = view
        self.operation = operation
        setSelector()
    }
    
    // MARK: - Private methods
    
    private func setSelector() {
        view?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
    }
    
    // MARK: - Private selector
    
    @objc func viewTapped() {
        operation.cancel()
    }
    
}
