//
//  AwaitToast.swift
//  AwaitToast
//
//  Created by DongHeeKang on 03/03/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

public class AwaitToast: ToastCompatiable {
    
    // MARK: - Properties
    
    static var operationQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "com.k-lpmg.AwaitToast.operationQueue"
        return queue
    }()
    
    // MARK: - Class methods
    
    public class func latestDismiss() {
        operationQueue.operations.last?.cancel()
    }
    
    public class func dismissAll() {
        operationQueue.cancelAllOperations()
    }
    
    // MARK: - Public methods
    
    public func finish() {
        toastAbstractMethod()
    }
    
    public func show() {
        toastAbstractMethod()
    }
    
    public func dismiss() {
        toastAbstractMethod()
    }
    
}
