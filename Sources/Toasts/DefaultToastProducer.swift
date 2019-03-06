//
//  DefaultToastProducer.swift
//  AwaitToast
//
//  Created by DongHeeKang on 28/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

class DefaultToastProducer<A>: Toast where A: ToastAppearance {
    
    var view: ToastView<A>!
    
    private let _operation: DefaultToastOperation<A>
    
    init(view: ToastView<A>) {
        self.view = view
        self._operation = DefaultToastOperation<A>(view: view)
    }
    
    override func show() {
        type(of: self).operationQueue.addOperation(_operation)
    }
    
    override func dismiss() {
        _operation.cancel()
    }
    
}
