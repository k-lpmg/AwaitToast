//
//  AwaitToastProducer.swift
//  AwaitToast
//
//  Created by DongHeeKang on 03/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

class AwaitToastProducer<A>: AwaitToast where A: ToastAppearance {
    
    var view: AwaitToastView<A>!
    
    private let _operation: AwaitToastOperation<A>
    
    init(view: AwaitToastView<A>) {
        self.view = view
        self._operation = AwaitToastOperation<A>(view: view)
    }
    
    override func show() {
        type(of: self).operationQueue.addOperation(_operation)
    }
    
    override func finish() {
        _operation.finish()
    }
    
    override func dismiss() {
        _operation.cancel()
    }
    
}
